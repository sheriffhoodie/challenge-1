class Page < ApplicationRecord
  validates :title, presence: true

  has_many :links
  has_many :headers

  def initialize(title, url)
    @title = title
    @url = url
  end
  attr_reader :title
  attr_reader :url
end
