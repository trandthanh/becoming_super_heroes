class Subject < ApplicationRecord

  validates :category, inclusion: { in: ["Tête", "Corps", "Conférences", "Ateliers"], message: "%{value} n'est pas une catégorie autorisée" }
end
