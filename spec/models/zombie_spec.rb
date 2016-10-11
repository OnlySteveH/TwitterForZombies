require 'rails_helper'

describe Zombie do
	it 'is invalid with no name' do
		zombie = Zombie.new
		expect(zombie).to be_invalid
	end

	it 'include tweets' do
		tweet1 = Tweet.new(status: "Argh!")
		tweet2 = Tweet.new(status: "Hungry!")
		zombie = Zombie.new(name: "Ash", tweets: [tweet1, tweet2])
		expect(zombie.tweets).to include(tweet1)
		expect(zombie.tweets).to include(tweet2)
  end

  it "is born with 1 weapon" do
  	w = Weapon.new(name: "Sword", zombie_id: 1)
  	zombie = Zombie.new(name: "Ash", graveyard: "The Chequers")
  	expect(zombie.weapon.count).to eq(1)
  end
end