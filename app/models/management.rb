class Management < ActiveRecord::Base
  belongs_to :request
  belongs_to :category

  validates_presence_of :subject, :category_id
end
