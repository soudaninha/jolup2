class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :eventcate
  has_many :comments
  
  validates :title, presence: true, length: {minimum: 5}
  validates :user_id, presence: true
  
  ## sunspot ##
  # validates_presence_of :title, :content
  # searchable do
  #   text :title, :default_boost => 2
  #   text :content
  # end
  
  def self.search(search)
    where("content LIKE ? OR title LIKE ?", "%#{search}%", "%#{search}%")
  end
  
end
