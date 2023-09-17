class Material < ApplicationRecord
  belongs_to :location, optional: true
  has_many :item_requests, as: :item
end
