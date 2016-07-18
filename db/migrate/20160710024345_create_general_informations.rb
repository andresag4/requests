class CreateGeneralInformations < ActiveRecord::Migration
  def change
    create_table :general_informations do |t|
      t.references :request, index: true, foreign_key: true
      t.references :title, index: true, foreign_key: true
      t.string :name
      t.string :father_last_name
      t.string :mother_last_name
      t.date :birthdate
      t.references :gender, index: true, foreign_key: true
      t.string :email
      t.string :position
      t.string :organization
      t.string :ip
      t.boolean :anonymous

      t.timestamps null: false
    end
  end
end
