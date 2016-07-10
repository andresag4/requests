class CreateRequestFiles < ActiveRecord::Migration
  def change
    create_table :request_files do |t|
      t.references :request, index: true, foreign_key: true
      t.attachment :file

      t.timestamps null: false
    end
  end
end
