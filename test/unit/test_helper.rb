require 'factory_girl'
require 'minitest/autorun'

require_relative './../../requires.rb'

class MiniTest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end

FactoryGirl.find_definitions


