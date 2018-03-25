require 'rails_helper'

describe ZombieMailer do 
	context '#welcome' do
		let(:zombie) { Zombie.create(name: "Ian", graveyard: "Raj") }
		#let(:zombie) { stub(name: "Ian", graveyard: "Raj") }
		subject { ZombieMailer.welcome(zombie) }
		 it "emanates from the correct email address"  do
		 	 expect(subject.from).to include("admin@zombie.com")  
		 end

		it "is sent to the correct recipient" do
		  expect(subject.to).to include("zombie@example.com")
		end


		it "contains the correct subject" do
		  expect(subject.subject).to eq("Welcome")
		end
	end
	
end