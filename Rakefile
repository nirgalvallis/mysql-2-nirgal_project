require 'rake'
require 'rake/testtask'

task :default => ["test:units"]

desc "Run unit tests"
Rake::TestTask.new("test:units") { |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
  t.warning = false
}