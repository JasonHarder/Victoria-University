class Event < ApplicationRecord
  has_one :picture
  accepts_nested_attributes_for :picture, allow_destroy: true
end
