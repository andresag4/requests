class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :request, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
