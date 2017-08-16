require "test_helper"

class DigestCRC32Test < Minitest::Test

  INPUTS = [
    "",
    " ",
    "x",
    "abc",
    "abc" * 100,
  ]

  def test_inputs
    INPUTS.each do |input|
      expected = "%08x" % Zlib.crc32(input)
      actual = Digest::CRC32.new.hexdigest(input)
      assert_equal expected, actual
    end
  end

  def test_accumulation
    expected = "%08x" % Zlib.crc32(INPUTS.join(""))

    actual = INPUTS.reduce(Digest::CRC32.new) do |digest, input|
      digest.update(input)
    end.hexdigest

    assert_equal expected, actual
  end

end
