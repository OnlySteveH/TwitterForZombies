class Zombie < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :graveyard, presence: true
	has_one :brain, dependent: :destroy
	has_many :assignments
	has_many :roles, through: :assignments
	has_many :tweets
	has_one :weapon
	scope :rotting, -> { where(rotting: true) }
	scope :recent, -> { order("created_at desc").limit(3) }
	after_save :decomp_change_notification, if: :decomp_changed?
	after_initialize :init

	def init
		self.hungry = true if self.hungry.nil?
	end

	def as_json(options = nil)
		super(options || 
					{ include: :brain, except: [:created_at, :updated_at, :id] })
	end

	def make_hungry
		#makes the zombie hungry set to true
		hungry = true
	end

	def hungry?
		hungry == true
	end

	def toggle(zombie_params)
    hungry = !hungry?
  end

	def avatar_url
    "http://zombitar.com/#{self.id}.jpg"
	end

	def decapitate
		weapon.slice
		self.decomp = "Dead (again)"
	end

	# def initialize

	# end

	private

	def decomp_change_notification
		#ZombieMailer.decomp_change(self).deliver_now
	end

end
