class Weapon < ActiveRecord::Base
	belongs_to :zombie
	validates :zombie, presence: true

	def slice

	end

end
