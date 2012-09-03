module Nirgal
  class Column < DbObject
      attr_accessor :type, :auto_increment, :default_value, 
        :is_not_null, :length, :precision, :scale,  
        :is_foreign_key, 
        :table
      attr_reader :indexes
    
    def initialize properties = nil
      @auto_increment = false
#      @default_value = nil
      @is_not_null = false
      @is_foreign_key = false
#      @table = nil

      @indexes = Indexes.new
  
      super properties
    end
    
    def valid?
      super do
        @errors[:table_is_present] = "'table' is missing" if @table.nil?
      end
    end
  end
end