class Story < ApplicationRecord
  belongs_to :match
  belongs_to :course
  belongs_to :talk
end
