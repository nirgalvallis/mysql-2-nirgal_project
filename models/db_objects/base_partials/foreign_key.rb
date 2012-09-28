module Nirgal
  class ForeignKey < DbObject
    # property :mandatory, :FalseClass
    # property :many, :FalseClass
    # property :referenced_table, :Table
    # property :owner_table, :Table
    # property :reversed_name, :String
    # property :referenced_columns, :Columns
    # property :owner_columns, :Columns

    # attr_accessor :mandatory, :many, 
      # :referenced_table, :owner_table,
      # :reversed_name 
    # attr_reader :referenced_columns, :owner_columns
#       
    # def initialize properties = nil
      # @mandatory = false
      # @many= false
# #      @referenced_table = nil
# #      @owner_table = nil
# #      @reversed_name = nil
# 
      # @referenced_columns = Columns.new
      # @owner_columns = Columns.new
#       
      # super properties
    # end
    
#    def valid?
#      super do
#        @errors[:referenced_table_is_present] = "'referenced_table' is missing" if @referenced_table.nil?
#        @errors[:referenced_columns_are_present] = "'referenced_columns' is empty" if @referenced_columns.empty?
#        @errors[:owner_table_is_present] = "'owner_table' is missing" if @owner_table.nil?
#        @errors[:owner_columns_are_present] = "'owner_columns' is empty" if @owner_columns.empty?
#      end
#    end
  end
end