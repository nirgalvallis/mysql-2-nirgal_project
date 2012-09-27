%w(
  ./models/helpers/*.rb
  ./models/db_objects/db_object.rb
  ./models/db_objects/table.rb
  ./models/db_objects/column.rb
  ./models/db_objects/**/*.rb
  ./models/containers/db_container.rb
  ./models/containers/**/*.rb
  ./models/*.rb
).each do |directory|
  Dir.glob("#{directory}").each do |path|
    require path
  end
end



