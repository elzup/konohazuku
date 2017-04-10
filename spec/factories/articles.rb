FactoryGirl.define do
  factory :article do
    title { FFaker::Book.title }
    message { FFaker::Internet.http_url + FFaker::Lorem.sentence }
    author_id { create(:user).id }
    factory :article_with_assign do
      transient { user_count 5 }
      after(:create) do |article, evaluator|
        article.assigned_users = create_list(:user, evaluator.user_count)
      end
    end
  end
end
