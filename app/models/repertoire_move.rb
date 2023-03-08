class RepertoireMove < ApplicationRecord
  belongs_to :user
  belongs_to :position

  delegate :fen, to: :position
  delegate :color, to: :position
end
