# == Schema Information
#
# Table name: requests
#
#  id             :integer          not null, primary key
#  folio          :string
#  reception_date :date
#  data_type      :integer
#  user_id        :integer
#  entry_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Request < ActiveRecord::Base
  has_one :project
  has_one :complaint
  has_one :audience
  has_one :resume
  has_one :contact
  has_one :general_information

  has_many :request_files

  belongs_to :user
  belongs_to :entry

  enum data_type: [:project, :complaint, :audience, :resume]

  #validates_presence_of :folio, :reception_date, :data_type, :entry_id

  accepts_nested_attributes_for :project
  accepts_nested_attributes_for :contact
  accepts_nested_attributes_for :general_information

  def self.i18n_data_type(hash = {})
    data_types.keys.each { |key| hash[I18n.t("data_type.#{key}")] = key }
    hash
  end
end
