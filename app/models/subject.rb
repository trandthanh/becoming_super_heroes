class Subject < ApplicationRecord
  validates :category, inclusion: { in: ["Tête", "Corps", "Confiance", "Compétences"], message: "%{value} n'est pas une catégorie autorisée" }
end
