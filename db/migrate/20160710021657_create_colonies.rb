class CreateColonies < ActiveRecord::Migration
  def change
    create_table :colonies do |t|
      t.string :name
      t.string :postcode
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
