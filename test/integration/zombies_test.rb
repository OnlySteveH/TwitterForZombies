require 'test_helper'

class ZombiesTest < ActionDispatch::IntegrationTest
	fixtures :all
  test "anyone can view zombie information" do 
  	zombie = zombies(:ash)
  	get zombie_url(zombie)

  	assert_response :success
  	assert_select "h1", zombie.name
  end

  test "anyone can view zombie information with Capybara" do 
  	zombie = zombies(:ash)
  	visit zombie_url(zombie)
  	assert_equal zombie_path(zombie), current_path
  	within("h1") do
  		assert has_content?(zombie.name)
  	end
  end

  test "navigation is available to the zombie page" do
  	tweet = FactoryGirl.create(:tweet)
    zombie = tweet.zombie
  	visit root_url
  	within("#tweet_#{tweet.id}") do
  		click_link zombie.name
  		assert_equal zombie_path(zombie), current_path
  	end
  end
end
