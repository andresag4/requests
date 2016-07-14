# == Schema Information
#
# Table name: resumes
#
#  id          :integer          not null, primary key
#  request_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Resume < ActiveRecord::Base
  belongs_to :request
  belongs_to :category
  has_many :languages, dependent: :destroy
  has_many :studies, dependent: :destroy
  has_many :abilities, dependent: :destroy

  accepts_nested_attributes_for :languages, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :studies, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :abilities, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :category_id
end
