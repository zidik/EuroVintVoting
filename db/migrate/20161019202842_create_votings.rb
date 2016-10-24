class CreateVotings < ActiveRecord::Migration[5.0]
  def change
    create_table :votings do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :stop_time

      t.timestamps
    end
  end
end
