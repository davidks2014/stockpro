class Request < ApplicationRecord
  belongs_to :location
  has_many :item_requests
  belongs_to :user
end
