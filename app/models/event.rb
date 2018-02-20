class Event < ApplicationRecord
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
