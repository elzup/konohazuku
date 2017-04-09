class User < ActiveRecord::Base
  has_many :approvals
  has_many :assigned_articles, through: :approvals
  has_many :created_articles, :class_name => "Article", :foreign_key => 'author_id'

  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  protected
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    user
  end
end
