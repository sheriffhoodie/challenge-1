class Page < ApplicationRecord
  validates :title, presence: true
  
  has_many :links
  has_many :headers
end
