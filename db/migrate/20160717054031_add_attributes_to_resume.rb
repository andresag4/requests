class AddAttributesToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :profile, :jsonb
  end
end
