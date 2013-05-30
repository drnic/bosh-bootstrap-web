class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  def self.from_omniauth(auth)
    logger.info auth.extra.inspect
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
      user.name = auth["info"]["name"]
    end
  end
end
