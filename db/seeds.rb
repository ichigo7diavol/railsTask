# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hash = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path('../seeds.yml', __FILE__))))
hash['projects'].each do |key, value|
  pr = Project.create title: key['title']
  key['todos'].each do |k, v|
    #print(k['text'], " ", k['isCompleted'])
    todo = Todo.create text: "#{k['text']}", isCompleted: k['isCompleted']
    pr.todos << todo
  end
  pr.save
end
