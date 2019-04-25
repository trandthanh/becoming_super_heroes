class Mentee < ApplicationRecord
  has_one :user
  has_one :mentor, through: :user

  # validates :hospital, presence: true
  # validates :sickness, presence: true

  HOSPITALS = ['Institut Curie', 'Pitié Salpétrière', 'Saint-Louis']
end
