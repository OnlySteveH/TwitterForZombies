require 'rails_helper'

describe Zombie do
	it 'is invalid with no name' do
		zombie = Zombie.new
		expect(zombie).to be_invalid
	end

	# it "throws an exception with no name" do
	# 	zombie = Zombie.new
	# 	expect { zombie.save! }.to raise_error(
	# 		ActiveRecord::RecordInvalid)
	# end

	it 'includes tweets' do
		tweet1 = Tweet.new(status: "Argh!")
		tweet2 = Tweet.new(status: "Hungry!")
		zombie = Zombie.new(name: "Ash", tweets: [tweet1, tweet2])
		expect(zombie.tweets).to include(tweet1)
		expect(zombie.tweets).to include(tweet2)
  end

  it "changes the number of zombies by one" do
  	zombie = Zombie.new(name: "Steve", graveyard: "The Artichoke")
  	expect{ zombie.save }.to change{ Zombie.count }.by(1)
	end

	it "should be hungry when created" do
		zombie = Zombie.create(name: "Steve3", graveyard: "The Artichoke")
		expect(zombie.hungry?).to be_truthy
	end

	it "should respond to hungry?" do
		zombie = Zombie.create(name: "Steve2", graveyard: "The Artichoke")
		expect(zombie).to respond_to(hungry?)
	end
end