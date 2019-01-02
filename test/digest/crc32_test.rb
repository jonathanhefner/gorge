require "test_helper"

class DigestCRC32Test < Minitest::Test

  INPUTS = [
    "",
    " ",
    (" ".."~").to_a.join,
    Random.new(0).bytes(16 * 1024 + 32),
  ]

  def test_string
    INPUTS.each do |input|
      expected = "%08x" % Zlib.crc32(input)
      actual = Digest::CRC32.new.hexdigest(input)
      assert_equal expected, actual
    end
  end

  def test_accumulation
    expected = "%08x" % Zlib.crc32(INPUTS.join)

    actual = INPUTS.reduce(Digest::CRC32.new) do |digest, input|
      digest.update(input)
    end.hexdigest

    assert_equal expected, actual
  end

  def test_file
    expected = "%08x" % Zlib.crc32(INPUTS.join)

    actual = Tempfile.create("crc23_test.tmp") do |file|
      file.write(INPUTS.join)
      file.rewind
      Digest::CRC32.file(file).hexdigest
    end

    assert_equal expected, actual
  end

end
