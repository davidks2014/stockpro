class DeliveryOrder < ApplicationRecord
  belongs_to :location
  has_many :item_requests, dependent: :destroy
  has_many_attached :photos
end
