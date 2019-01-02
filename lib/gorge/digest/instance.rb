module Digest::Instance

  # Updates the Digest using the entire contents of the given IO-like,
  # and returns the Digest modified.  Seeks to the beginning of the
  # IO-like before reading, and restores its initial position after
  # reading.  See also +Digest::Instance#file+.
  #
  # @param io_like [IO, StringIO, IO-like]
  # @return [self]
  def io(io_like)
    pos = io_like.pos # save position
    io_like.seek(0)

    buffer = ""
    while io_like.read(16384, buffer)
      self.update(buffer)
    end

    io_like.seek(pos) # restore position

    self
  end

end
