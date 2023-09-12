class ItemRequest < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :request
end
