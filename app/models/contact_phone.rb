# == Schema Information
#
# Table name: contact_phones
#
#  id                     :integer          not null, primary key
#  general_information_id :integer
#  tag                    :string
#  number                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class ContactPhone < ActiveRecord::Base
  validates_presence_of :tag, :number
  validates_numericality_of :number
end
