class ItemRequest < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :request
  belongs_to :delivery_order, , optional: true
end
