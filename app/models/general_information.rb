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
  belongs_to :request
  belongs_to :title
  belongs_to :gender
end
