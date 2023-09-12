class Location < ApplicationRecord
  has_many :material_stockcounts
  has_many :import_materials, dependent: :destroy
  has_many :users
  has_many :materials, dependent: :destroy
  has_many :equipment, dependent: :destroy
  has_many :requests
end
