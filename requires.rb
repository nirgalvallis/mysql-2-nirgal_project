%w(
  ./models/*.rb
  ./models/db_objects/db_object.rb
  ./models/db_objects/**/*.rb
  ./models/containers/db_container.rb
  ./models/containers/**/*.rb
).each do |directory|
  Dir.glob("#{directory}").each do |path|
    require path
  end
end



