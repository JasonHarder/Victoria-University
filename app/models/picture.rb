class Picture < ApplicationRecord
  belongs_to :teacher
  belongs_to :event
end
