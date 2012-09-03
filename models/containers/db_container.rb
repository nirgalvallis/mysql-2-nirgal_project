module DbModel
  class DbContainer < Hash
  
    ## Internal class to define what kind of class objects can be added to the container
    class DbArray < Array
      
      # initializes a new array with a list of accepted class in the container
      # an exception will be raised if a classe is not inherited from DbObject
      def initialize classes
        classes = [classes] unless classes.is_a? Array
        validate_classes(classes)
        
        super classes
      end
    
      # overrides << operator to ensure that the received object is a DbObject inherited class before insertion
      def <<(klass)
        validate_class klass
        
        super klass
      end
      
      private
      # returns true if the class is a derived class from DbObject
      def accept_class? klass
        return false if klass.nil?
        
        klass.class == Class && (klass == DbObject || accept_class?(klass.superclass))      
      end
      
      # validates that each class object in the array are derived from DbObject
      # raises an exception if an invalid class is received
      def validate_classes classes
        classes.all? { |klass| validate_class klass }      
      end
      
      # validates that the received class is derived from DbObject
      # raises an exception if an invalid class is received
      def validate_class klass
        raise InvalidClassError.new "constainer only accepts 'DbObject' derived classes" unless accept_class? klass      
        
        true
      end
    end
  
    attr :accepted_classes
    
    # Initializes the container with the accepted class(es)
    def initialize classes = []
      @accepted_classes = DbArray.new classes
    end
    
    # overrides the []= operator to perform a validation that the object is accepted in the container.
    # sets the DbObject's internal id
    def []=(key, elem)
      raise InvalidClassError.new "the container accept objects of classe(s): #{@accepted_classes.to_s}" unless @accepted_classes.include? elem.class
  
      if elem.id.nil?
        elem.id = next_id  
      end
      
      super key, elem    
    end
    
    # adds a new accepted class to the list
    def add_accepted_class klass
      @accepted_classes << klass unless @accepted_classes.include? klass
    end
    
    # removes a class from the accepted classes' list
    def remove_accepted_class klass
      @accepted_classes.delete klass
    end
    
    def valid?
      true
    end
    
    private
    # returns the next unused internal id for a new DbObject
    def next_id
      (map { |key, values| values.id}.max || 0) + 1
    end
  end
end