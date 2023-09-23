class UpdateMaterial < ApplicationRecord
  belongs_to :location
  belongs_to :material

  def sg_time
    update_date.in_time_zone('Asia/Singapore').strftime('%Y-%m-%d %H:%M:%S')
  end


end
