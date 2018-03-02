class CreateTeacherPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_pictures do |t|
      t.string :name
      t.string :url
      t.belongs_to :teacher
      t.timestamps
    end
  end
end
