class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.references :voting, foreign_key: true
      t.references :participant, foreign_key: true
      t.integer :order_no

      t.timestamps
      t.index [:voting_id, :participant_id], :unique => true
    end
  end
end
