class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true

  def online
    REDIS.sadd("online", self.username)
    AppearanceBroadcastJob.perform_later list
  end

  def offline
    REDIS.srem("online", self.username)
    AppearanceBroadcastJob.perform_later list
  end

  def list
    REDIS.smembers("online")
  end
end
