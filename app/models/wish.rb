class Wish < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?

  belongs_to :user
  has_many :tracks

  validates :status, inclusion: { in: ["Nouveau", "En cours d'organisation", "Inscrit", "Annulé", "Terminé"] }

  def set_defaults
    self.status  ||= 'Nouveau'
  end
end
