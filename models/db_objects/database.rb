module Nirgal
  class Database < DbObject
    property :tables, Tables, :readonly => true
    # attr_reader :tables
#     
    # def initialize properties = nil
      # id = 1
      # name = 'database 1'  
# 
      # super
    # end       
      # @tables = Tables.new
#   
      # super properties
    # end
        
#    def valid?
#      super do
#        errors[:tables] = "tables can only be assigned with a container of 'Table'" unless tables.accepted_classes == [Table]
#      end
#    end
    
  end
end