class Place < ActiveRecord::Base
	validates :name, :address, presence: true
end
