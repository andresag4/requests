class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.references :request, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
