class Stockcount < ApplicationRecord
  belongs_to :location
  belongs_to :material
end
