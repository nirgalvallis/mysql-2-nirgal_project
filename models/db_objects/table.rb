#require_relative './column'

module Nirgal
  class Table < DbObject
#      attr_reader :columns, :foreign_keys, :referenced_by_foreign_keys, :indexes
    property :columns, Columns
    property :foreign_keys, ForeignKeys
    property :referenced_by_foreign_keys, ForeignKeys
    property :indexes, Indexes
    
#    def initialize properties = nil
#      @columns = Columns.new 
#      @foreign_keys = ForeignKeys.new
#      @referenced_by_foreign_keys = ForeignKeys.new
#      @indexes = Indexes.new

#      super properties
#    end
    
#    def columns
#      puts "test"
#      @columns || @columns = Columns.new
#    end
  end
end