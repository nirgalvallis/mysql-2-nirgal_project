module DbModel
  class Table < DbObject
    attr_reader :columns, :foreign_keys, :referenced_by_foreign_keys, :indexes
    
    def initialize properties = nil
      @columns = Columns.new 
      @foreign_keys = ForeignKeys.new
      @referenced_by_foreign_keys = ForeignKeys.new
      @indexes = Indexes.new

      super properties
    end
  end
end