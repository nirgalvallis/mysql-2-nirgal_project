#require_relative './table'

module Nirgal
  class Column < DbObject
      # attr_accessor :type, :auto_increment, :default_value, 
        # :is_not_null, :length, :precision, :scale,  
        # :is_foreign_key, 
        # :table
      # attr_reader :indexes
      
      property :type, String
      property :auto_increment, FalseClass
      property :default_values, Fixnum
      property :is_not_null, TrueClass
      property :length, Fixnum
      property :precision, Fixnum
      property :scale, Fixnum
      property :is_foreign_key, FalseClass
      property :table, Table
      property :indexes, Indexes, :readonly => true
      
    
#    def initialize properties = nil
#      @auto_increment = false
#      @default_value = nil
#      @is_not_null = false
#      @is_foreign_key = false
#      @table = nil

#      @indexes = Indexes.new
  
#      super properties
#    end
    
#    def auto_increment
#      @auto_increment || false
#    end

    def valid?
      super do
        errors[:table_is_present] = "'table' is missing" if table.nil?
      end
    end
  end
end