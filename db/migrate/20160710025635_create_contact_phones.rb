class CreateContactPhones < ActiveRecord::Migration
  def change
    create_table :contact_phones do |t|
      t.references :general_information, index: true, foreign_key: true
      t.string :tag
      t.string :number

      t.timestamps null: false
    end
  end
end
