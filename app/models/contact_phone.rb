# == Schema Information
#
# Table name: contact_phones
#
#  id               :integer          not null, primary key
#  contactable_id   :integer
#  contactable_type :string
#  tag              :string
#  number           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ContactPhone < ActiveRecord::Base
  validates_presence_of :tag, :number
end
