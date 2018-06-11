class Team < ApplicationRecord
    
    has_many :teamrefs
    belongs_to :user
    
    validates :title, presence: true, length: {minimum: 1}
    
end
