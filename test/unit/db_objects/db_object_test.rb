require_relative './../test_helper'

class DbObjectTest < MiniTest::Unit::TestCase
  
  def setup
    @db_object = build :db_object
  end
  
  def test_db_object_is_valid
    assert @db_object.valid?, "object is invalid: errors = #{@db_object.errors}"
    assert_equal Hash.new, @db_object.errors
    assert_equal Array.new, @db_object.comments
  end
  
  def test_id_get_set
    @db_object.id = 200
    assert_equal 200, @db_object.id
  end
  
  def test_name_get_set
    @db_object.name = 'an_object'
    assert_equal 'an_object', @db_object.name
  end
  
  def test_comments_get_set
    @db_object.comments << 'this is a comment'
    assert_equal ['this is a comment'], @db_object.comments
  end
  
  def test_invalid_without_id
    db_object = Nirgal::DbObject.new :name => 'test'
    
    assert !db_object.valid?    
    refute_nil db_object.errors[:id]
  end
  
  def test_invalid_without_name
    db_object = Nirgal::DbObject.new :id => 1
    
    assert !db_object.valid?
    refute_nil db_object.errors[:name]
  end
  
  def test_initialize_with_comments_raises_no_method_error
    assert_raises NoMethodError do
      db_object = Nirgal::DbObject.new :name => 'test', :comments => 'commentaire'
    end
  end
  
  def test_add_comment_to_array
    @db_object.comments << 'commentaire'
    assert_equal ['commentaire'], @db_object.comments
    
    @db_object.comments << 'autre phrase'
    assert_equal ['commentaire', 'autre phrase'], @db_object.comments
  end
  
  def test_other_properties_go_to_custom_properties
    db_object = Nirgal::DbObject.new :id => 1, :name => 'test', :custom1 => 'custom1', :custom2 => 'custom2'
    
    assert db_object.valid?
    assert_equal({ :custom1 => 'custom1', :custom2 => 'custom2' }, db_object.custom_properties) 
  end
  
end