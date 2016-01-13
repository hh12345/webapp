class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text 'comments'
      t.references 'user'
      t.references 'activity'
    end
  end
  def down ; drop_table 'participations' ; end
end
