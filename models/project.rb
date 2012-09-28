require 'yaml'

module Nirgal
  class Project < DbObject
    property :databases, Databases, :readonly => true
#    include YAML
#    attr_reader :tables
    
#    def initialize properties = nil
#      @tables = Tables.new
      
#      super properties
#    end

    def save 
      File.open('/home/cboulanger/test.yaml', 'w') do |file|
        file.puts YAML::dump(self)
      end
    end
    
    def self.load
      YAML::load(File.open('/home/cboulanger/test.yaml', 'r'))
    end
    
  end
end