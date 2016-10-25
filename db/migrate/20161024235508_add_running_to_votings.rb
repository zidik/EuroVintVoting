class AddRunningToVotings < ActiveRecord::Migration[5.0]
  def change
    add_column :votings, :running, :boolean
  end
end
