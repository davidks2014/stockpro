class ItemRequest < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :request
  belongs_to :item_request
end
