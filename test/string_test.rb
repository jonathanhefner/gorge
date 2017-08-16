require "test_helper"

class StringTest < Minitest::Test

  def test_crc32
    assert_digest_matches(Digest::CRC32.new){|string| string.crc32 }
  end

  def test_md5
    assert_digest_matches(Digest::MD5.new){|string| string.md5 }
  end

  def test_sha1
    assert_digest_matches(Digest::SHA1.new){|string| string.sha1 }
  end

  def test_sha256
    assert_digest_matches(Digest::SHA256.new){|string| string.sha256 }
  end


  private

  INPUTS = [
    "",
    " ",
    "abc",
    "xyz" * 1000,
  ]

  def assert_digest_matches(digest_instance, &block)
    INPUTS.each do |input|
      assert_equal digest_instance.hexdigest(input), block.call(input)
    end
  end

end
