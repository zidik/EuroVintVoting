class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :registration, foreign_key: true
      t.string :from_phone
      t.string :to_phone
      t.string :from_country

      t.timestamps
    end
  end
end
