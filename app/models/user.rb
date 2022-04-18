# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  handle                 :string
#  phone_number           :string
#  bio                    :text
#  dob                    :date             not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable, :omniauthable

  validates :dob, presence: true #, format: { with: /\d{2}\/\d{2}\/\d{4}/, message: "Date must be in the following format: MM/DD/YYYY" }
  validates :email, presence: true, uniqueness: true
  validates :handle, uniqueness: true, length: { maximum: 15 }
  validates :phone_number, uniqueness: true
  validates :bio, length: { maximum: 160 }

  has_many :purrs

  has_many :likes

  has_many :liked_purrs,
    through: :likes,
    source: :purr

# Being followed:
  has_many :passive_follows,
    class_name: :Follow,
    foreign_key: :followee_id,
    dependent: :destroy
        
  has_many :followers,
    through: :passive_follows,
    source: :follower

# Following:
  has_many :active_follows,
    class_name: :Follow,
    foreign_key: :follower_id,
    dependent: :destroy
        
  has_many :followees,
    through: :active_follows,
    source: :followee

  def convert_date_string_to_date
    
  
  end




end
