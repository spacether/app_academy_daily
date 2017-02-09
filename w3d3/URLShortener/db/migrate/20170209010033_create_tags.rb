class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :topic_id, null: false
      t.integer :url_id, null: false
    end
  end
end
