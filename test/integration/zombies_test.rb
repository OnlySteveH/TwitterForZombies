require 'test_helper'

class ZombiesTest < ActionDispatch::IntegrationTest
	fixtures :all
  test "anyone can view zombie information" do 
  	zombie = zombies(:ash)
  	get zombie_url(zombie)

  	assert_response :success
  	assert_select "h1", zombie.name
  end
end
