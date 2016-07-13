# == Schema Information
#
# Table name: contact_phones
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  tag        :string
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactPhone < ActiveRecord::Base
  belongs_to :contact

  validates_presence_of :contact_id, :tag, :number

  ## HAcer polimorfica la tabla
end
