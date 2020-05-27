
# "people"=>"https://swapi.dev/api/people/"
# "planets"=>"https://swapi.dev/api/planets/"
# "films"=>"https://swapi.dev/api/films/"
# "species"=>"https://swapi.dev/api/species/"
# "vehicles"=>"https://swapi.dev/api/vehicles/"
# "starships"=>"https://swapi.dev/api/starships/"




require 'rest-client'
require 'pry'
require 'json'

class Swapi
    def initialize
	@people = []
	@planets = []
    end

    def get_planets(path)
	print "."
	planets = JSON.parse(RestClient.get(path))
	planets["results"].each { |planet| @planets << planet }
	return "complete" if planets["next"] == nil
	get_planets(planets["next"])

    end

    def get_people(path)
	print "."
	people = JSON.parse(RestClient.get(path))
	people["results"].each { |person| @people << person }
	return "complete" if people["next"] == nil
	get_people(people["next"])
    end

    def find_person(person)
	@people.find {|p| p["name"].include?(person)}	
    end

    def people
	@people
    end

    def planets
	@planets
    end
end

p = Swapi.new
print "Getting People"
p.get_people("http://swapi.dev/api/people/")
print "\nGetting Planets"
p.get_planets("http://swapi.dev/api/planets")
binding.pry
p
