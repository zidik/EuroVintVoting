class CreateRestrictedNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :restricted_numbers do |t|
      t.string :name
      t.string :number

      t.timestamps
    end
  end
end
