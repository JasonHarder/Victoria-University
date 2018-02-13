class CreateFaculties < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties do |t|
      t.string :name
      t.text :body
      t.string :picture

      t.timestamps
    end
  end
end
