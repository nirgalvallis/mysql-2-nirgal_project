module Nirgal
  class Index < DbObject
    attr_accessor :type, :is_unique, :is_primary,
      :owner_table
    attr_reader :referenced_columns
      
    def initialize properties = nil
#      @type = nil
      @is_unique = false
      @is_primary = false
#      @owner_table = nil
      
      @referenced_columns = Columns.new
      
      super properties
    end
  end
end