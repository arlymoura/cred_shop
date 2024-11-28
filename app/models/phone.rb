class Phone < ApplicationRecord
  belongs_to :proponent

  validates :phone_number, :phone_type, presence: true
  enum phone_type: { personal: 0, reference: 1 }
end
