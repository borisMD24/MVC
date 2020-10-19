require 'csv'

class Gossip 
  attr_accessor :content, :author
	
	def initialize(new_content, new_author)
		@content = new_content
		@author = new_author
	end
	
	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
					csv << [@content, @author]
		end
	end
	
	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
    	all_gossips << Gossip.new(csv_line[0], csv_line[1])
  	end
		return all_gossips
	end
	
	def self.find(id)
		return self.all[id]	
	end

end
