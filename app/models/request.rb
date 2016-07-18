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
#  area_id        :integer
#  responsible_id :integer
#

class Request < ActiveRecord::Base
  has_one :project, dependent: :destroy
  has_one :complaint, dependent: :destroy
  has_one :audience, dependent: :destroy
  has_one :resume, dependent: :destroy
  has_one :management, dependent: :destroy
  has_one :contact, dependent: :destroy
  has_one :general_information, dependent: :destroy

  has_many :request_files, dependent: :destroy

  belongs_to :user
  belongs_to :area
  belongs_to :responsible, foreign_key: :responsible_id, class_name: 'User'
  belongs_to :entry

  enum data_type: [:project, :complaint, :audience, :resume, :management]

  validates_presence_of :reception_date, :data_type, :entry_id

  accepts_nested_attributes_for :project
  accepts_nested_attributes_for :complaint
  accepts_nested_attributes_for :audience
  accepts_nested_attributes_for :resume
  accepts_nested_attributes_for :management
  accepts_nested_attributes_for :contact
  accepts_nested_attributes_for :general_information
  accepts_nested_attributes_for :request_files, allow_destroy: true, reject_if: :all_blank

  def self.i18n_data_type(hash = {})
    data_types.keys.each { |key| hash[I18n.t("data_types.#{key}")] = key }
    hash
  end

  def set_folio
    folio_name = ''

    case
      when self.project
        folio_name = 'PRO-'
      when self.complaint
        folio_name = 'DEN-'
      when self.audience
        folio_name = 'AUD-'
      when self.resume
        folio_name = 'CUR-'
    end

    self.update_attributes(folio: "#{folio_name}#{self.id}")
  end

  def assign_json_attributes(params)
    attributes = params[:request][:resume_attributes].slice(:work_objective, :experience)
    self.resume.work_objective = attributes[:work_objective]
    self.resume.experience = attributes[:experience]
    self.resume.profile = attributes
  end
end
