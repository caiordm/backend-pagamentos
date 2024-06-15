class Transfer < ApplicationRecord
  belongs_to :payee
  belongs_to :payer
end
