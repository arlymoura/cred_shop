class FinancialInfo < ApplicationRecord
  belongs_to :proponent

  validates :salary, presence: true
end
