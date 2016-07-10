# == Schema Information
#
# Table name: permissions
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  action      :string
#  controller  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Permission < ActiveRecord::Base
  has_many :permission_role, dependent: :destroy
  has_many :roles, through: :permission_role

  validates_presence_of :name, :description, :controller, :action
  validates_uniqueness_of :name, :controller, scope: :action
  before_save :format_permission

  protected

  # Applies format to the name of the permission.
  def format_permission
    self.name = self.name.squish.titleize.gsub('_', ' ')
  end
end
