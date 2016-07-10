# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  data_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :projects
  has_many :complaints
  has_many :audiences
  has_many :resumes

  enum data_type: [:project, :complaint, :audience, :resume]

  validates_presence_of :name, :data_type

  def self.i18n_data_type(hash = {})
    data_types.keys.each { |key| hash[I18n.t("data_type.#{key}")] = key }
    hash
  end
end