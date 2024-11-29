class FinancialInfo < ApplicationRecord
  belongs_to :proponent

  validates :salary, presence: true
  validates :salary, :numericality => { :greater_than_or_equal_to => 0 }
end
