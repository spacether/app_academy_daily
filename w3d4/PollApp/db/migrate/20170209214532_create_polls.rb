class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :title, null: false
      t.integer :user_id, null: false
    end
  end
end
