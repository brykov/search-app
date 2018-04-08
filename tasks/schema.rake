namespace :schema do
  desc 'Generates data schema files and saves them to lib/schema folder'
  task :generate => :environment do
    map = %q{
        function() { for (var key in this) { emit(key, %s.includes(key) ? this[key] : null); } }
      }
    reduce = %q{
        function(key, stuff) { return {values: Array.unique(stuff)}; }
      }

    [User, Organization, Ticket].each do |entity|
      schema = entity.map_reduce(map % entity.get_enums_list.to_json, reduce).out(inline: 1)
      schema = Hash[
        schema.results['results'].map do |rec|
          values = rec['value']['values'].select { |v| [String, Array].include?(v.class) }
          values = nil if values.empty?
          [
            rec['_id'],
            values
          ]
        end.to_a
      ]

      File.write('lib/schema/%s.json' % entity.name.downcase, schema.to_json)
    end
  end
end