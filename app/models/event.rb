class Event < ApplicationRecord
  has_one :event_picture
  accepts_nested_attributes_for :event_picture
end
