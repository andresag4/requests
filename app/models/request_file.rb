# == Schema Information
#
# Table name: request_files
#
#  id                :integer          not null, primary key
#  request_id        :integer
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class RequestFile < ActiveRecord::Base
  belongs_to :request

  validates_presence_of :request_id

  has_attached_file :file, styles: {medium: '300x300>', thumb: '200x200#'}, processors: [:autobackground],
                    default_url: '/assets/images/missing.jpg'
  do_not_validate_attachment_file_type :file
  validates_attachment_presence :file
  validates_attachment_size :file, less_than: 200.megabytes
end
