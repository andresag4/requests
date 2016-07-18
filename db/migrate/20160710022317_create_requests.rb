class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :folio
      t.date :reception_date
      t.integer :data_type
      t.references :user, index: true, foreign_key: true
      t.references :entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
