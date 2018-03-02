class Teacher < ApplicationRecord
  has_one :teacher_picture
  accepts_nested_attributes_for :teacher_picture
end
