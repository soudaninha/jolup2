class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_reader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :teams
  has_many :comments
  has_many :new_notifications
  
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_one :profile
  has_many :teamrefs
  
end
