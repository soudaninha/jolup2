class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :eventcate
  has_many :comments
  
  validates :title, presence: true, length: {minimum: 5}
  validates :user_id, presence: true
end
