class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  def self.from_omniauth(auth)
    find_by(uid: auth.uid) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    info = auth.info

    create!(uid: auth.uid, nickname: info.nickname, name: info.name)
  end
end
