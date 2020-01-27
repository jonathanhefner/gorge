module Digest::Instance

  # Updates the Digest using the entire contents of the given IO-like,
  # and returns the Digest.  Before reading, saves the current position
  # of the IO-like, and seeks to the beginning.  After reading, seeks
  # back to the saved position.
  #
  # @see https://docs.ruby-lang.org/en/master/Digest/Instance.html#method-i-file Digest::Instance#file
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
