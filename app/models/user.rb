class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :timetables
  has_many :recipes

  has_many :follower_relationships, foreign_key: :followee_id, class_name: 'Relationship', dependent: :destroy
  has_many :followee_relationships, foreign_key: :follower_id, class_name: 'Relationship', dependent: :destroy

  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followees, through: :followee_relationships, source: :followee

  def follow(user)
    followee_relationships.create(followee_id: user.id)
  end

  def unfollow(user)
    followee_relationships.find_by(followee_id: user.id)&.destroy
  end

  def following?(user)
    followees.include?(user)
  end
end
