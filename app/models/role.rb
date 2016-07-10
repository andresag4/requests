# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string
#  key         :string
#  description :text
#  scope       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ActiveRecord::Base
  has_many :users
  has_many :permission_role, dependent: :destroy
  has_many :permissions, through: :permission_role

  enum scope: [:total, :site, :owner]

  validates_presence_of :name, :description, :scope
  validates_uniqueness_of :key, allow_blank: true

  def is_protected?
    self.key == 'god'
  end
end
