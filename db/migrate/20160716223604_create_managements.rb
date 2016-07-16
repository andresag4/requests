class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|
      t.references :request, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :subject
      t.text :description

      t.timestamps null: false
    end
  end
end
