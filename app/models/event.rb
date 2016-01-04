class Event < ActiveRecord::Base
  has_many :photos
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
