class Post < ActiveRecord::Base
  
  acts_as_paranoid
  
  mount_uploader :s3_file, ImageUploader
  
  belongs_to :user
  belongs_to :eventcate # 포스트는 공모전 카테고리는 하나만
  has_and_belongs_to_many :interestcates
  accepts_nested_attributes_for :interestcates
  has_many :comments
  
  validates :title, presence: true, length: {minimum: 1}
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
  
  # 조회수
  has_many :impressions, :as=>:impressionable
  
  def impression_count
    impressions.size
  end
  
  def unique_impression_count
    impressions.group(:ip_address).size.keys.length
  end
  
end
