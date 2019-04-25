class Mentee < ApplicationRecord
  has_one :user

  # validates :hospital, presence: true
  # validates :sickness, presence: true

  HOSPITALS = ['Institut Curie', 'Pitié Salpétrière', 'Saint-Louis']
end
