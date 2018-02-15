class AddPictureRefToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_reference :teachers, :picture, foreign_key: true
  end
end
