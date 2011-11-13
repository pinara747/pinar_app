class User < ActiveRecord::Base
  has_many :authentications
  def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
       user.name = auth['info']['name'] || ""
       user.email = auth['info']['email'] || ""
    end
  end
  attr_protected :provider, :uid, :name, :email
 end
end