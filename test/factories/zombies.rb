FactoryGirl.define do 
	factory :zombie do
		sequence(:name) { |i| "Ash#{i}"}
		graveyard "Oak Park"

		factory :armed_zombie do
	    association :weapon
	  end
	end
end