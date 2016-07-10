class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.references :request, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :subject
      t.text :notes

      t.timestamps null: false
    end
  end
end
