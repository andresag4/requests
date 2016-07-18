# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  request_id  :integer
#  category_id :integer
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ActiveRecord::Base
  belongs_to :request
  belongs_to :category

  validates_presence_of :name, :category_id
end
