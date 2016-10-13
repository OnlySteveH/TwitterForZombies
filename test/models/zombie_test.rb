require 'test_helper'

class ZombieTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:graveyard)
  should have_many(:tweets)
  should validate_uniqueness_of(:name)
	def setup
		#@z = zombies(:ash)
    @z = FactoryGirl.create(:zombie)
    @az = FactoryGirl.create(:armed_zombie)
	end

  test "invalid without a name" do
  	z = Zombie.new
  	assert !z.valid?, "Name is not being validated"
  end

  test "valid with all attributes" do
  	assert @z.valid?, "Zombie was not valid"
  end

  # test "invalid name gives error message" do
  # 	@z.name = nil
  # 	assert_presence(@z, :name)
  # end

  # test "invalid graveyard gives error message" do
  # 	@z.graveyard = nil
  # 	assert_presence(@z, :graveyard)
  # end

  test "can generate avatar_url" do
  	assert_equal "http://zombitar.com/#{@z.id}.jpg", @z.avatar_url
  end

  test "should respond to tweets" do
  	assert_respond_to @z, :tweets
  end

  test "should contain only tweets that belong to zombie" do
  	assert @z.tweets.all? { |t| t.zombie == @z}
  end

  test "decapitate should set status to dead again" do
    #@z.weapon.stubs(:slice)
    @zombie = FactoryGirl.create(:zombie, 
                            decomp: "Rotting", 
                            weapon: FactoryGirl.create(:weapon))
    @zombie.decapitate
    assert_equal "Dead (again)", @zombie.decomp
  end

  test "decapitate should call slice" do
    @az.weapon.expects(:slice)
    @az.decapitate
  end
end
