class DeliveryOrder < ApplicationRecord
  belongs_to :location, optional: true
  has_many :item_requests

end
