class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      
      t.references 'user'
      t.references 'activity'
    end
  end
  def down ; drop_table 'participations' ; end
end
