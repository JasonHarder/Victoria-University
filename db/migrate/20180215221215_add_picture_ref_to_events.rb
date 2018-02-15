class AddPictureRefToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :picture, foreign_key: true
  end
end
