class Proponent < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one :financial_info, dependent: :destroy
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :address, :financial_info, :phones

  validates :name, :cpf, presence: true
end
