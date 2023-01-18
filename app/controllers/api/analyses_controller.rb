class Api::AnalysesController < ActionController::API
  def create
    @analysis = Analysis.new(analysis_params)

    if @analysis.save
      head 201
    else
      render json: @analysis.errors, status: :bad_request
    end
  end

  private

  def analysis_params
    params.permit(:depth, :score, :best_move, :criticality, :position_id)
  end
end
