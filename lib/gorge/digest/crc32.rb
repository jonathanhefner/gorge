class Digest::CRC32 < Digest::Class

  def initialize
    reset
  end

  # Returns the block length of the Digest.
  #
  # @return [Integer]
  def block_length
    1
  end

  # Returns the length in bytes of the hash value of the Digest.
  #
  # @return [Integer]
  def digest_length
    4
  end

  # Resets the Digest to its initial state, and returns the Digest
  # modified.
  #
  # @return [self]
  def reset
    @crc32 = 0
  end

  # Updates the Digest using the given string, and returns the Digest
  # modified.
  #
  # @return [self]
  def update(string)
    @crc32 = Zlib.crc32(string, @crc32)
    self
  end

  alias :<< :update

  # Returns the hash value of the Digest packed into a string.
  #
  # @return [String]
  def finish
    [@crc32].pack("N")
  end

end
