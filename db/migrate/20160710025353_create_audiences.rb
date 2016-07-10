class CreateAudiences < ActiveRecord::Migration
  def change
    create_table :audiences do |t|
      t.references :request, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :subject
      t.text :description

      t.timestamps null: false
    end
  end
end
