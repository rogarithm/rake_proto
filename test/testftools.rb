require 'ftools'
require 'test/unit'
require 'filecreation'

class TestFtools < Test::Unit::TestCase
  include FileCreation

  def setup
    File.makedirs('testdata')
    File.makedirs('testdata/dir1', 'testdata/dir2')
    create_file('testdata/fl1')
  end

  def test_catname_when_to_is_not_dir
    assert_equal('testdata/fl1', File.catname('fl2','testdata/fl1'))
  end

  def test_catname_when_to_is_dir
    assert_equal('testdata/dir1/fl1', File.catname('fl1','testdata/dir1'))
  end

  #def test_catname_when_to_ends_with_slash_or_backslash
  #  assert_equal('testdata/dir1/fl1', File.catname('fl1','testdata/dir1/'))
  #end

  #def test_catname_when_to_has_basename
  #  assert_equal('testdata/dir1/fl1', File.catname('temp/fl1','testdata/dir1'))
  #end

  def teardown
    Dir.rmdir('testdata/dir1')
    Dir.rmdir('testdata/dir2')
    File.delete('testdata/fl1')
    Dir.rmdir('testdata')
  end
end
