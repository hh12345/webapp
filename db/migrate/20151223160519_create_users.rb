class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :department
      t.string :studentnumber
      t.string :phonenumber
      t.string :age
      t.string :sex

      t.timestamps null: false
    end
  end
end
