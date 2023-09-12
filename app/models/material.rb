class Material < ApplicationRecord
  belongs_to :location
  has_many :item_requests, as: :item
end
