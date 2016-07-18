class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
