class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.references :user, index: true, foreign_key: true
      t.string :tag
      t.string :number

      t.timestamps null: false
    end
  end
end
