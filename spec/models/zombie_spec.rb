require 'rails_helper'

describe Zombie do

	let(:zombie) { Zombie.create(name: "Steve", graveyard: "The Artichoke") }

	it 'is invalid with no name' do
		zombie = Zombie.new
		expect(zombie).to be_invalid
	end

	it "throws an exception with no name" do
		zombie = Zombie.new
		expect { zombie.save! }.to raise_error(
			ActiveRecord::RecordInvalid)
	end

	it "should respond to :name" do
		expect(subject).to respond_to(:name)
	end

	it { expect(subject).to respond_to(:name) }

	it 'includes tweets' do
		tweet1 = Tweet.new(status: "Argh!")
		tweet2 = Tweet.new(status: "Hungry!")
		zombie = Zombie.new(name: "Ash", tweets: [tweet1, tweet2])
		expect(zombie.tweets).to include(tweet1)
		expect(zombie.tweets).to include(tweet2)
  end

  it "changes the number of zombies by one" do
  	expect{ zombie.save }.to change{ Zombie.count }.by(1)
	end

	it "should be hungry? when created" do
		expect(zombie).to satisfy { |z| z.hungry? }
	end

	it "should respond to hungry?" do
		expect(zombie).to respond_to(:hungry?)
	end

	it "reverses the hungry status from truthy when toggle is called" do
		expect(zombie.hungry).to be_truthy
		zombie.toggle
		expect(zombie.hungry).to be_falsey
	end

	it "reverses the hungry status from falsey when toggle is called" do
		zombie.hungry = false
		expect(zombie.hungry).to be_falsey
		zombie.toggle
		expect(zombie.hungry).to be_truthy
	end	

	it "toggle method toggles either hungry status" do
		h = zombie.hungry
		expect { zombie.toggle }.to change { zombie.hungry }.from(h).to(!h)
		zombie.hungry = false
		h = zombie.hungry
		expect { zombie.toggle }.to change { zombie.hungry }.from(h).to(!h)
	end	
end