class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :style
      t.text :introduction 
      t.datetime :starttime
      t.datetime :deadline
      t.integer :limitednumber
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :activities, [:user_id, :created_at]
  end
end
