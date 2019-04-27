class Mentee < ApplicationRecord
  has_one :user
  has_one :mentor, through: :user
  has_one :match

  # validates :hospital, presence: true
  # validates :sickness, presence: true

  HOSPITALS = ['Institut Curie', 'Pitié Salpétrière', 'Saint-Louis']
end
