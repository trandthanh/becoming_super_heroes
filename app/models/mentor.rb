class Mentor < ApplicationRecord
  has_one :user
  has_one :mentee, through: :user
  has_one :match
end
