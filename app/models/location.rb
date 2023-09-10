class Location < ApplicationRecord
  has_many :material_stockcounts
  has_many :import_materials
  has_many :users
  has_many :materials
  has_many :equipment
  has_many :requests
end
