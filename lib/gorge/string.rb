class String

  # Returns the MD5 hash (in hexadecimal format) of the String.
  #
  # @return [String]
  def md5
    Digest::MD5.hexdigest(self)
  end

  # Returns the SHA1 hash (in hexadecimal format) of the String.
  #
  # @return [String]
  def sha1
    Digest::SHA1.hexdigest(self)
  end

  # Returns the SHA256 hash (in hexadecimal format) of the String.
  #
  # @return [String]
  def sha256
    Digest::SHA256.hexdigest(self)
  end

end
