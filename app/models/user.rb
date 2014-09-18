class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  validates :password, confirmation: true


def self.from_omniauth(auth)
  binding.pry
  where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
end

def self.create_from_omniauth(auth)
  create! do |user|
    user.uid = auth["uid"]
    user.name = auth["info"]["nickname"]
  end
end

end
