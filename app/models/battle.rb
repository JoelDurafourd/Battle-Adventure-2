class Battle < ApplicationRecord
  belongs_to :character
  belongs_to :enemy
end
