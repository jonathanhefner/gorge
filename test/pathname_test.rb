require "test_helper"

class PathnameTest < Minitest::Test

  def test_crc32
    assert_digest_matches(Digest::CRC32.new){|path| path.file_crc32 }
  end

  def test_md5
    assert_digest_matches(Digest::MD5.new){|path| path.file_md5 }
  end

  def test_sha1
    assert_digest_matches(Digest::SHA1.new){|path| path.file_sha1 }
  end

  def test_sha256
    assert_digest_matches(Digest::SHA256.new){|path| path.file_sha256 }
  end


  private

  def assert_digest_matches(digest_instance, &block)
    path = Pathname.new(__FILE__)
    assert_equal digest_instance.file(path).hexdigest, block.call(path)
  end

end
