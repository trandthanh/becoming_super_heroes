class Course < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  has_many :attendances
end
