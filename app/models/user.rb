class User < ActiveRecord::Base
  has_many :approvals
  has_many :assigned_articles, :through => :approvals, :source => :article
  has_many :created_articles, :class_name => 'Article', :foreign_key => :author_id

  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def approval(article)
    approvals.find_by_article_id(article)
  end

  protected
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
      user = User.create(
          name: data["name"],
          email: data["email"]
      )
    end
    user
  end
end
