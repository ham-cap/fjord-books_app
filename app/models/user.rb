# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_relationships,   class_name: "Follow",
                                   foreign_key: "follower_id",
                                     dependent: :destroy

  has_many :passive_relationships,  class_name: "Follow",
                                   foreign_key: "followed_id",
                                     dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed

  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    self.following << other_user
  end

  def unfollow(other_user)
    self.active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    self.following.include?(other_user)
  end
end
