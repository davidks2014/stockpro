class ItemRequest < ApplicationRecord
  belongs_to :material
  belongs_to :equipment
  belongs_to :request
end
