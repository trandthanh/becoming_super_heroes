class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # belongs_to :mentor

  belongs_to :mentee, optional: true
  belongs_to :mentor, optional: true
  has_many :wishes
end
