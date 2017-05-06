FactoryGirl.define do
  factory :user do
    name { FFaker::NameJA.name }
    email { FFaker::Internet.email }

    factory :user_with_articles do
      transient { created_count 5 }
      transient { assigned_count 5 }
      after(:create) do |user, evaluator|
        create_list(:article_with_assign, evaluator.created_count, author: user)
        user.assigned_articles = create_list(:article_with_assign, evaluator.assigned_count)
        user.approvals do |approval|
          next if rand < 0.5
          approval.is_approved = true
          approval.approved_at = (1..5).to_a.sample.days.ago
          approval.save
        end
      end
    end
  end
end
