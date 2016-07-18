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

  has_attached_file :file, styles: {medium: '300x300>', thumb: '200x200#'}, default_url: '/assets/images/missing.jpg'
  do_not_validate_attachment_file_type :file
  validates_attachment_presence :file
  validates_attachment_size :file, less_than: 25.megabytes

  before_file_post_process :allow_only_images

  # Method that apply style in case of an image.
  def allow_only_images
    unless file.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|gif|png|tif|raw|bmp|svg|)$}
      false
    end
  end
end
