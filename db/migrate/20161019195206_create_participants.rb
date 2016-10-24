class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :country
      t.string :artist
      t.string :title

      t.timestamps
    end
  end
end
