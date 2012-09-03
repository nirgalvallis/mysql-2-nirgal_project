require_relative './../test_helper'

class TableTest < MiniTest::Unit::TestCase
  def setup
    @table = build :table
  end
  
  def test_factory_table_is_valid
    assert @table.valid?, "table is invalid with errors: #{@table.errors.inspect}"
    assert @table.columns.empty?
    assert @table.foreign_keys.empty?
    assert @table.referenced_by_foreign_keys.empty?
    assert @table.indexes.empty?
  end
  
  def test_initialize_table_with_custom_name
    table = Nirgal::Table.new :name => 'custom_name'
    
    assert_equal 'custom_name', table.name
  end
  
  ## 
  # Test columns property

  def test_columns_is_readonly 
    assert_raises NoMethodError do
      @table.columns = Nirgal::Columns.new
    end
  end
  
  def test_get_columns
    assert_equal Hash.new, @table.columns
    
    column = build :column
    @table.columns[column.name] = column
    
    assert_equal({column.name => column}, @table.columns)
  end
  
  def test_columns_will_not_accept_other_object_type
    assert_raises Nirgal::InvalidClassError do
      @table.columns[:test] = Nirgal::Table.new
    end

    assert_raises Nirgal::InvalidClassError do
      @table.columns[:test] = "test"
    end
  end
  
  ##
  # Test referenced_by_foreign_keys property

  def test_referenced_by_foreign_keys_is_readonly
    assert_raises NoMethodError do
      @table.referenced_by_foreign_keys = Nirgal::ForeignKeys.new
    end
  end
  
  def test_get_referenced_by_foreign_keys
    assert_equal Hash.new, @table.referenced_by_foreign_keys
    
    fk = build :foreign_key
    @table.referenced_by_foreign_keys[fk.name] = fk
    
    assert_equal({fk.name => fk}, @table.referenced_by_foreign_keys)
  end

  def test_reference_by_foreign_keys_will_not_accept_other_object_type
    assert_raises Nirgal::InvalidClassError do
      @table.referenced_by_foreign_keys[:test] = Nirgal::Table.new
    end

    assert_raises Nirgal::InvalidClassError do
      @table.referenced_by_foreign_keys[:test] = "test"
    end
  end
  
  ##
  # Test foreign_keys property

  def test_foreign_keys_is_readonly
    assert_raises NoMethodError do
      @table.foreign_keys = Nirgal::ForeignKeys.new
    end
  end
  
  def test_get_foreign_keys
    assert_equal Hash.new, @table.foreign_keys
    
    fk = build :foreign_key
    @table.foreign_keys[fk.name] = fk
    
    assert_equal({fk.name => fk}, @table.foreign_keys)
  end

  def test_foreign_keys_will_not_accept_other_object_type
    assert_raises Nirgal::InvalidClassError do
      @table.foreign_keys[:test] = Nirgal::Table.new
    end

    assert_raises Nirgal::InvalidClassError do
      @table.foreign_keys[:test] = "test"
    end
  end
  
  ##
  # Test indexes property

  def test_indexes_is_readonly
    assert_raises NoMethodError do
      @table.indexes = Nirgal::Indexes.new
    end
  end
  
  def test_get_indexes
    assert_equal Hash.new, @table.indexes
    
    index = build :index
    @table.indexes[index.name] = index
    
    assert_equal({index.name => index}, @table.indexes)
  end

  def test_indexes_will_not_accept_other_object_type
    assert_raises Nirgal::InvalidClassError do
      @table.indexes[:test] = Nirgal::Table.new
    end

    assert_raises Nirgal::InvalidClassError do
      @table.indexes[:test] = "test"
    end
  end



end