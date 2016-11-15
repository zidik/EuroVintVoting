class AddActiveToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :active, :boolean
  end
end
