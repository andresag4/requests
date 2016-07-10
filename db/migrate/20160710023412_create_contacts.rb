class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :request, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true
      t.references :colony, index: true, foreign_key: true
      t.string :postcode
      t.string :street
      t.string :internal_number
      t.string :external_number

      t.timestamps null: false
    end
  end
end
