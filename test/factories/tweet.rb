FactoryGirl.define do
	factory :tweet do 
		status 'one'
		association :zombie
	end
end