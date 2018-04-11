class Page < ApplicationRecord
  validates :title, :url, presence: true

  attr_reader :title
  attr_reader :url
end
