class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:oauth]

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.name  = auth[:info][:name]
      user.email = auth[:info][:email]
    end
  end
end
