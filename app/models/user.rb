class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  validates :username, presence: true
  validates :email, uniqueness: true

  def appear
    REDIS.sadd("online", self.username)
    AppearanceBroadcastJob.perform_later list
  end

  def away
    REDIS.srem("online", self.username)
    AppearanceBroadcastJob.perform_later list
  end

  def list
    REDIS.smembers("online")
  end
end
