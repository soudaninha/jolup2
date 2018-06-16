class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_reader
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  
  has_many :posts
  has_many :members
  has_many :teams, through: :members, dependent: :destroy
  has_many :comments
  has_many :new_notifications
  
  validates_associated :members # More on this later
  
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_one :profile
  has_many :teamrefs
  
end
