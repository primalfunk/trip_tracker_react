class Trip < ApplicationRecord
  has_many :stops, dependent: :destroy

  def self.dump
    Trip.find_by_sql("select t.id, t.name, s.name as stop_name, s.address as stop_address, s.id as stop_id from trips t join stops s on s.trip_id = t.id")
  end

end
