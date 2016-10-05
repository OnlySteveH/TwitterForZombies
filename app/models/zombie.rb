class Zombie < ActiveRecord::Base
	validates :name, presence: true
	has_one :brain, dependent: :destroy
	has_many :assignments
	has_many :roles, through: :assignments
	has_many :tweets
	has_many :weapons
	scope :rotting, -> { where(rotting: true) }
	scope :recent, -> { order("created_at desc").limit(3) }
	after_save :decomp_change_notification, if: :decomp_changed?

	def as_json(options = nil)
		super(options || 
					{ include: :brain, except: [:created_at, :updated_at, :id] })
	end

	private

	def decomp_change_notification
		ZombieMailer.decomp_change(self).deliver_now
	end

end