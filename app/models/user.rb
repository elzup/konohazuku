class User < ActiveRecord::Base
	devise :omniauthable, :omniauth_providers => [:google_oauth2]
  protected
#  def self.find_for_google(auth)
#    user = user.find_by(email: auth.info.email)
#
#    unless user
#      user = user.create(name:     auth.name,
#                         provider: auth.provider,
#                         uid:      auth.uid,
#                         token:    auth.credentials.token,
#                         password: devise.friendly_token[0, 20],
#                         meta:     auth.to_yaml)
#    end
#    user
#	end
 def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    user
 end
end
