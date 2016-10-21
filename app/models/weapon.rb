class Weapon < ActiveRecord::Base
	belongs_to :zombie
	validates :zombie, presence: true

	def slice
		#stuff in here
		return true
	end

end
