class AddTeacherRefToPictures < ActiveRecord::Migration[5.1]
  def change
    add_reference :pictures, :teacher, foreign_key: true
  end
end
