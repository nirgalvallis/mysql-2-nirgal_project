module Nirgal
  class Index < DbObject
    # attr_accessor :type, :is_unique, :is_primary,
      # :owner_table
    # attr_reader :referenced_columns
    
    property :type, String
    property :is_unique, FalseClass
    property :is_primary, FalseClass
    property :owner_table, Table
    property :referenced_columns, Columns
#       
    # def initialize properties = nil
# #      @type = nil
      # @is_unique = false
      # @is_primary = false
# #      @owner_table = nil
#       
      # @referenced_columns = Columns.new
#       
      # super properties
    # end
  end
end