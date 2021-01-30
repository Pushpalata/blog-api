FactoryBot.define do
	factory :comment do
		comment_text { Faker::Lorem.word }
		post_id nil
	end
end