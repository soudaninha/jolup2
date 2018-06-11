class Profile < ApplicationRecord
  belongs_to :user
  
  has_and_belongs_to_many :interestcates
  accepts_nested_attributes_for :interestcates
  
  has_and_belongs_to_many :eventcates
  accepts_nested_attributes_for :eventcates
  
  has_and_belongs_to_many :workcates
  accepts_nested_attributes_for :workcates
  
  has_and_belongs_to_many :profcates
  accepts_nested_attributes_for :profcates
  
end
