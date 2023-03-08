class RepertoireMovesController < ApplicationController
  def create
    @repertoire_move = RepertoireMove.new(repertoire_params)
    @repertoire_move.user = current_user

    @repertoire_move.save
  end

  private

  def repertoire_params
    params.require(:repertoire_move).permit(:position_id, :move)
  end
end
