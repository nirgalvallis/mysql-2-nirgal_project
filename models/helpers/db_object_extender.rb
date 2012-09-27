module Nirgal
  module DbObjectExtender
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def property name, klass, options = {}
        
        function =  "def #{name}; "
        function << "  the_class = eval(\"#{klass.to_s}\"); "
        function << "  if the_class.respond_to? :new; "
        function << "    @#{name} || @#{name} = the_class.new; "
        function << "  elsif the_class.ancestors.include? Numeric; "
        function << "    @#{name} || @#{name} = 0; "
        function << "  elsif the_class == TrueClass; "
        function << "    #{name} || #{name} = true; "
        function << "  elsif the_class == FalseClass; "
        function << "    #{name} || #{name} = false; "
        function << "  else; "
        function << "    raise InvalidClassError.new \"Class '\#{the_class}' is not supported in method 'property'\"; "
        function << "  end; "
        function << "end"
        module_eval( function )
        
#        the_class = eval("#{klass.to_s}")
        
        # getter
#        send :define_method, name do
#          if the_class.respond_to? :new
#            eval("@#{name} || @#{name} = #{the_class}.new")
#          elsif the_class.ancestors.include? Numeric
#            eval("@#{name} || @#{name} = 0")
#          elsif [TrueClass, FalseClass].include? the_class
#            eval("@#{name} || @#{name} = false")
#          else
#            raise InvalidClassError.new "Class '#{the_class}' is not supported in method 'property'"
#          end
#        end
        
        # setter onless readonly or custom db_object 
        module_eval( "def #{name}=(val) @#{name} = val; end" ) unless options[:readonly] == true
        #unless is_nirgal_db_container(eval("#{klass.to_s}")) || options[:readonly] == true
      end
      
    end

      
    
  
  end
end