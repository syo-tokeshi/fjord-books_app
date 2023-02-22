# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_relationships,  class_name: 'UserRelationship',
           foreign_key: :follower_id,
           dependent: :destroy,
           inverse_of: :follower

  has_many :passive_relationships, class_name: 'UserRelationship',
           foreign_key: :followed_id,
           dependent: :destroy,
           inverse_of: :followed

  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def following?(other_user)
    active_relationships.where(followed_id: other_user.id).exists?
  end

  def follow(other_user)
    active_relationships.find_or_create_by!(followed_id: other_user.id)
  end

  def unfollow(other_user)
    friendship = active_relationships.find_by(followed_id: other_user.id)
    friendship.destroy! if !!friendship
  end

end
