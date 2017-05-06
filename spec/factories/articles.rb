FactoryGirl.define do
  factory :article do
    title { ['連絡事項', 'これ捨てていいですか', 'これ借ります', 'ここ移動しますね'].sample + FFaker::Book.title }
    message { 'これこれがこうです。URL も確認してください。 ' + FFaker::Internet.http_url }
    author_id { create(:user).id }
    factory :article_with_assign do
      transient { user_count 5 }
      after(:create) do |article, evaluator|
        article.assigned_users = create_list(:user, evaluator.user_count)
      end
    end
  end
end
