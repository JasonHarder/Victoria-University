class AddReasonToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :reason, :text
  end
end
