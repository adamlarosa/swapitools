
# "people"=>"https://www.swapi.co/api/people/"
# "planets"=>"https://www.swapi.co/api/planets/"
# "films"=>"https://www.swapi.co/api/films/"
# "species"=>"https://www.swapi.co/api/species/"
# "vehicles"=>"https://www.swapi.co/api/vehicles/"
# "starships"=>"https://www.swapi.co/api/starships/"




require 'rest-client'
require 'pry'
require 'json'

class Swapi
    def initialize
	@people = [] 
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
end

p = Swapi.new
p.get_people("http://www.swapi.co/api/people/")
binding.pry
p
