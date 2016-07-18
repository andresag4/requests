class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :institution
      t.string :degree
      t.date :end_study
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
