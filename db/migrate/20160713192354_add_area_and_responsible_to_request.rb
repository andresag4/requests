class AddAreaAndResponsibleToRequest < ActiveRecord::Migration
  def change
    add_reference :requests, :area, index: true, foreign_key: true
    add_column :requests, :responsible_id, :integer
  end
end
