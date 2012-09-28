require_relative './../test_helper'

class DatabaseTest < MiniTest::Unit::TestCase
  
  def setup
    @database = build :database
  end
  
  def test_factory_database_is_valid
    assert @database.valid?, "database is invalid with errors: #{@database.errors.inspect}"
#    assert_equal 1, @database.id
#    assert_equal 'database 1', @database.name
    assert @database.tables.empty?
  end
  
  def test_initialize_database_with_custom_name
    database = Nirgal::Database.new :name => 'custom name'
    
    assert_equal database.name, 'custom name'
  end
  
  ## 
  # Test tables property

  def test_tables_is_readonly 
    assert_raises NoMethodError do
      @database.tables = Nirgal::Tables.new
    end
  end
  
  def test_get_tables
    assert_equal Hash.new, @database.tables
    
    table = build :table
    @database.tables[table.name] = table
    
    assert_equal({table.name => table}, @database.tables)
  end
  
  def test_tables_will_not_accept_other_object_type
    assert_raises Nirgal::InvalidClassError do
      @database.tables[:test] = Nirgal::Column.new
    end

    assert_raises Nirgal::InvalidClassError do
      @database.tables[:test] = "test"
    end
  end

  ##
  # test custom_properties

  def test_assert_custom_properties_are_added_at_initialization
    database = Nirgal::Database.new :custom => 'custom value'
    
    assert_equal({:custom => 'custom value'}, database.custom_properties)
  end
  
  def test_assert_custom_properties_are_added_at_with_method
    assert_equal Hash.new, @database.custom_properties
    
    @database.custom_properties[:custom] = 'custom value'

    assert_equal({:custom => 'custom value'}, @database.custom_properties)
  end
  
  
end
