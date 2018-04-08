desc 'Import the data from lib/import into the database'
task :import => :environment do
  [User, Organization, Ticket].each do |entity|
    entity.delete_all
    name = entity.name.downcase.pluralize
    JSON.parse(File.read('lib/import/%s.json' % name)).each do |rec|
      entity.create!(rec)
    end
    puts 'Imported %s: %d' % [name, entity.count]
  end

end
