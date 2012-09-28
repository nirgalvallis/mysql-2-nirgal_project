module Nirgal
  module DbObjectExtender
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def property name, klass, options = {}
        
        # function =  "def #{name}; "
        # function << "  the_class = eval(\"#{klass.to_s}\"); "
        # function << "  if the_class.respond_to? :new; "
        # function << "    @#{name} ||= the_class.new; "
        # function << "  elsif the_class.ancestors.include? Numeric; "
        # function << "    @#{name} ||= 0; "
        # function << "  elsif the_class == TrueClass; "
        # function << "    #{name} ||= true; "
        # function << "  elsif the_class == FalseClass; "
        # function << "    #{name} ||= false; "
        # function << "  else; "
        # function << "    raise InvalidClassError.new \"Class '\#{the_class}' is not supported in method 'property'\"; "
        # function << "  end; "
        # function << "end"
       # module_eval( function )
        
#        the_class = eval("#{klass.to_s}")
        
        # getter
       send :define_method, name do
#         if klass.respond_to? :new
#           eval("@#{name} ||= #{klass}.new")
#         elsif klass.ancestors.include? Numeric
#           eval("@#{name} ||= 0")
#         elsif klass == TrueClass
         if klass == TrueClass
           eval("@#{name}.defined? ? @#{name} : @#{name} = true")
         elsif klass == FalseClass
           eval("@#{name}.defined? ? @#{name} : @#{name} = false")
         elsif klass.ancestors.include?(Nirgal::DbContainer)
           eval("@#{name} ||= #{klass}.new")
         else
           eval("@#{name}")
#           raise InvalidClassError.new "Class '#{the_class}' is not supported in method 'property'"
         end
       end
        
        # setter onless readonly or custom db_object 
        module_eval( "def #{name}=(val) @#{name} = val; end" ) unless klass.ancestors.include?(Nirgal::DbContainer) || options[:readonly] == true
      end
      
      # def is_nirgal_db_container klass
        # klass.ancestors.include?(Nirgal::DbContainer)
      # end
    end

    
  
  end
end