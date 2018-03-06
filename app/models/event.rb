class Event < ApplicationRecord
  has_one :event_picture , :dependent => :destroy
  accepts_nested_attributes_for :event_picture
end
