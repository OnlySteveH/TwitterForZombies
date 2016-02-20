class Zombie < ActiveRecord::Base
	has_one :brain, dependent: :destroy
	has_many :assignments
	has_many :roles, through: :assignments
	has_many :tweets
	scope :rotting, -> { where(rotting: true) }
	scope :recent, -> { order("created_at desc").limit(3) }
	after_save :decomp_change_notification, if: :decomp_changed?

	private

	def decomp_change_notification
		ZombieMailer.decomp_change(self).deliver_now
	end

end
