class Tweet < ActiveRecord::Base
	belongs_to :zombie
	validates :status, length: { maximum: 140 }
	validates :zombie, presence: true
	validates :zombie_id, presence: true
end
