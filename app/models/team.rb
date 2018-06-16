class Team < ApplicationRecord
    
    has_many :teamrefs
    has_many :members
    has_many :users, through: :members, dependent: :destroy
    validates_associated :members # More on this later
    
    validates :title, presence: true, length: {minimum: 1}
    
end
