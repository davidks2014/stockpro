class DeliveryOrder < ApplicationRecord
  belongs_to :location
  has_many :item_requests
end
