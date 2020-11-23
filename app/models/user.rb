class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank

  validates :first_name, presence: true, length: { minimum: 3 }, on: :update

  def full_name
    [first_name, last_name].join(" ")
  end

end
