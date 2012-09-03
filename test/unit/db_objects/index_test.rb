require_relative './../test_helper'

class ForeignKeyTest < MiniTest::Unit::TestCase
  def setup
    @fk = build :index
  end
  
  def test_factory_foreign_key_is_valid
    assert @fk.valid?, "foreign_key is invalid: #{@fk.errors.inspect}"
  end
  
end