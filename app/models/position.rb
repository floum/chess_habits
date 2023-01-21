class Position < ApplicationRecord
  validates_uniqueness_of :fen
end
