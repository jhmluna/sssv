class Request < ApplicationRecord
  INSTRUMENTS = %w[Medidor\ de\ Energia\ Elétrica Medidor\ de\ Água Medidor\ de\ Gás].freeze
  SERVICES = %w[Verification Expertise].freeze
  STATES = %w[Acre Alagoas Amapá Amazonas Bahia Ceará Distrito\ Federal Espírito\ Santo Goiás Maranhão Mato\ Grosso
              Mato\ Grosso\ do\ Sul Minas\ Gerais Pará Paraíba Paraná Pernambuco Piauí Rio\ de\ Janeiro
              Rio\ Grande\ do\ Norte Rio\ Grande\ do\ Sul Rondônia Santa\ Catarina São\ Paulo Sergipe Tocantins].freeze
  STATUS = %w[Aberta Em\ andamento Realizada].freeze
  belongs_to :citizen, class_name: 'User'
  belongs_to :tech, optional: true, class_name: 'User'
  validates :instrument, :service, :location, :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_description, against: :description,
      using: { tsearch: { prefix: true } }
end
