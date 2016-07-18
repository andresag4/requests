class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :percentage
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
