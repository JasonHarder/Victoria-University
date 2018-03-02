class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :event_pictures do |t|
      t.string :name
      t.string :url
      t.belongs_to :event
      t.timestamps
    end
  end
end
