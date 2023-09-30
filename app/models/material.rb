class Material < ApplicationRecord
  belongs_to :location, optional: true
  has_many :item_requests, as: :item
  has_many :stockcounts
  has_one_attached :photo
end
