# == Schema Information
#
# Table name: general_informations
#
#  id               :integer          not null, primary key
#  request_id       :integer
#  title_id         :integer
#  name             :string
#  father_last_name :string
#  mother_last_name :string
#  birthdate        :date
#  gender_id        :integer
#  email            :string
#  position         :string
#  organization     :string
#  ip               :string
#  anonymous        :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class GeneralInformation < ActiveRecord::Base
  has_many :contact_phones

  belongs_to :request
  belongs_to :title
  belongs_to :gender

  validates_presence_of :name, :father_last_name, :mother_last_name, unless: :anonymous?

  accepts_nested_attributes_for :contact_phones, allow_destroy: true, reject_if: :all_blank

  def validate_one_contact_form

  end

  def anonymous?
    self.anonymous
  end
end
