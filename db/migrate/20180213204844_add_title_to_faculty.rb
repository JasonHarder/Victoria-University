class AddTitleToFaculty < ActiveRecord::Migration[5.1]
  def change
    add_column :faculties, :title, :string
  end
end
