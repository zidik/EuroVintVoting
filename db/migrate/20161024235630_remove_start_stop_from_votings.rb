class RemoveStartStopFromVotings < ActiveRecord::Migration[5.0]
  def change
    remove_column :votings, :start_time, :datetime
    remove_column :votings, :stop_time, :datetime
  end
end
