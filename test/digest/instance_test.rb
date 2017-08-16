require "test_helper"

class DigestInstanceTest < Minitest::Test

  def test_io_with_file
    file = __FILE__

    expected = Digest::MD5.new.file(file).hexdigest
    actual = File.open(file, "r"){|f| Digest::MD5.new.io(f).hexdigest }
    assert_equal expected, actual
  end

  def test_io_with_stringio
    stringio = StringIO.new("abc" * 10)

    expected = Digest::SHA1.new.hexdigest(stringio.string)
    actual = Digest::SHA1.new.io(stringio).hexdigest
    assert_equal expected, actual
  end

  def test_io_restores_pos
    stringio = StringIO.new("abc" * 10)
    pos = stringio.length / 4

    stringio.seek(pos)
    assert Digest::SHA256.new.io(stringio)
    assert_equal pos, stringio.pos
  end

end
