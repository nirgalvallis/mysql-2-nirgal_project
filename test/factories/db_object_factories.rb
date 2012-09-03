FactoryGirl.define do

  factory :db_object, class: Nirgal::DbObject do
    sequence(:id)
    sequence(:name) {|n| "base_object-#{n}"}
  end

  factory :database, class: Nirgal::Database do
  end
  
  factory :table, class: Nirgal::Table, parent: :db_object do
    sequence(:name) {|n|"table-#{n}"}
  end 
  
  factory :column, class: Nirgal::Column, parent: :db_object do
    sequence(:name) {|n|"column-#{n}"}
    association :table, factory: :table, strategy: :build    
  end
  
  factory :foreign_key, class: Nirgal::ForeignKey, parent: :db_object do
    sequence(:name) {|n| "foreign_key-#{n}"}    
    association :referenced_table, factory: :table, strategy: :build

#    after :build do |foreign_key|
#      foreign_key.referenced_columns.merge! b
#    end
  end
  
  factory :index, class: Nirgal::Index do
    sequence(:name) {|n| "index-#{n}"}    
  end
  
#  factory :primary_key, class: Nirgal::Columns
  
end
