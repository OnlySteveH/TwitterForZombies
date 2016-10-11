class Tweet < ActiveRecord::Base
	belongs_to :zombie
	validates :status, length: { maximum: 140 }
end
