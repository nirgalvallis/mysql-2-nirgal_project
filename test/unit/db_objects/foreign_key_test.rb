require_relative './../test_helper'

class ForeignKeyTest < MiniTest::Unit::TestCase
  def setup
    @fk = build :foreign_key
  end
  
  def test_factory_foreign_key_is_valid
    assert @fk.valid?, "foreign_key is invalid: #{@fk.errors.inspect}"
  end
  
  # def test_foreign_without_referenced_table_is_invalid
    # fk = DbModel::ForeignKey.new :name => 'test'
    # assert_nil fk.referenced_table
    # assert !fk.valid?
    # refute_nil fk.errors[:referenced_table_is_present]
  # end
#   
  # def test_foreign_without_referenced_columns_is_invalid
    # fk = DbModel::ForeignKey.new :name => 'test'
    # assert_empty fk.referenced_columns
    # assert !fk.valid?
    # refute_nil fk.errors[:referenced_columns_are_present]
  # end
end