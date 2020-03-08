require 'rest-client'
require 'pry'
require 'json'

class Swapi
    def initialize
	@array = [] 
    end

    def get_people(path)
	print "."
	people = JSON.parse(RestClient.get(path))
	people["results"].each { |person| @array << person }
	return "complete" if people["next"] == nil
	get_people(people["next"])
    end

    def people
	@array
    end
end

p = Swapi.new
p.get_people("http://www.swapi.co/api/people/")
binding.pry
p
