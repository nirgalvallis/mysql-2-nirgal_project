module Nirgal
  class DbObject
    include DbObjectExtender
    
#    attr_accessor :id, :name
#    attr_reader :comments, :custom_properties, :errors
    property :id, Fixnum
    property :name, String
    property :comments, Array, :readonly => true
    property :custom_properties, Hash, :readonly => true
    property :errors, Hash, :readonly => true
    
    def initialize properties = nil
#      @errors = {}
#      @custom_properties = {}
#      @comments = []
  
      properties.each do |key, value|
        if key.is_a?(Symbol)
          if self.respond_to?(key)
            eval("self.#{key} = value")  # defined properties
          else
            custom_properties[key] = value # undefined properties
          end
        end # ignores non-symbol key values
      end if properties.is_a? Hash
    end
    
    def errors
      @errors ||= {}
    end
    
    def custom_properties
      @custom_properties ||= {}
    end
    
    def comments
      @comments ||= []
    end
    
    ## 
    # true if object is valid
    def valid?
      if block_given?
        errors = {} # reset error messages
        yield
      end
  
      self.errors[:id] = "'id' is missing" if id.nil?
      self.errors[:name] = "'name' is missing" if name.nil?
      
      is_valid
    end
    
    
    private
    def is_valid
      errors.empty?
    end
    
    
  end
end

