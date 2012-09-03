require_relative './../test_helper'

class ColumnTest < MiniTest::Unit::TestCase
  def setup
    @column = build :column
  end
  
  def test_factory_column_is_valid
    assert @column.valid?, "column is invalid: #{@column.errors.inspect}"
  end
  
  def test_column_without_table_is_invalid
    column = Nirgal::Column.new :name => 'test'
    assert_nil column.table
    assert !column.valid?
    refute_nil column.errors[:table_is_present]
  end
  
  ##
  # Test indexes property

  def test_indexes_is_readonly
    assert_raises NoMethodError do
      @column.indexes = Nirgal::Indexes.new
    end
  end
  
  def test_get_indexes
    assert_equal Hash.new, @column.indexes
    
    index = build :index
    @column.indexes[index.name] = index
    
    assert_equal({index.name => index}, @column.indexes)
  end

  def test_indexes_will_not_accept_other_object_type
    assert_raises Nirgal::InvalidClassError do
      @column.indexes[:test] = Nirgal::Table.new
    end

    assert_raises Nirgal::InvalidClassError do
      @column.indexes[:test] = "test"
    end
  end  
end