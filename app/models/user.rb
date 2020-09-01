class User < ApplicationRecord
  has_many  :pics, dependent: :destroy
  has_many :likes
  has_many :comments

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, through: :followed_users

  has_many :following_users, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #For Paperclip gem
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/picture/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
