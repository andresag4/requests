# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  mother_last_name       :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  role_id                :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_presence_of :first_name, :last_name, :mother_last_name, :email
  validates :first_name, :last_name, :mother_last_name, format: {with: /(^[a-zA-Z\sáéíóúü]+$)/}

  attr_accessor :current_password

  has_many :requests

  belongs_to :role
  delegate :name, :scope, :key, to: :role, prefix: true

  def full_name
    "#{self.first_name} #{self.last_name} #{self.mother_last_name}"
  end

  def first_name=(s)
    super s.titleize
  end

  def last_name=(s)
    super s.titleize
  end

  def mother_last_name=(s)
    super s.titleize
  end

  def god?
    role and role.key == 'god'
  end

  def has_total_scope?
    role_scope == 'total'
  end
end
