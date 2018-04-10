class PageResource < JSONAPI::Resource
  attributes :title
  has_many :headers
  has_many :links
end
