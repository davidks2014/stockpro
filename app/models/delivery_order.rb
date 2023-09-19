class DeliveryOrder < ApplicationRecord
  belongs_to :location, optional: true
end
