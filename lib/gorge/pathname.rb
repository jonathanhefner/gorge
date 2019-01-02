require "pathname"

class Pathname

  # Returns the CRC32 checksum (in hexadecimal format) of the contents
  # of the file indicated by the Pathname.
  #
  # @return [String]
  def file_crc32
    Digest::CRC32.file(self).hexdigest
  end

  # Returns the MD5 hash (in hexadecimal format) of the contents of the
  # file indicated by the Pathname.
  #
  # @return [String]
  def file_md5
    Digest::MD5.file(self).hexdigest
  end

  # Returns the SHA1 hash (in hexadecimal format) of the contents of the
  # file indicated by the Pathname.
  #
  # @return [String]
  def file_sha1
    Digest::SHA1.file(self).hexdigest
  end

  # Returns the SHA256 hash (in hexadecimal format) of the contents of
  # the file indicated by the Pathname.
  #
  # @return [String]
  def file_sha256
    Digest::SHA256.file(self).hexdigest
  end

end
