# == Schema Information
#
# Table name: contacts
#
#  id              :integer          not null, primary key
#  request_id      :integer
#  state_id        :integer
#  city_id         :integer
#  colony_id       :integer
#  postcode        :string
#  street          :string
#  internal_number :string
#  external_number :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Contact < ActiveRecord::Base
  has_many :contact_phones

  belongs_to :request
  belongs_to :state
  belongs_to :city
  belongs_to :colony

  validates_presence_of :request_id
end
