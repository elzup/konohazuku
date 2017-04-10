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
      end
    end
  end
end
