module Api
  class UsersController < ActionController::API
    def show
      @user = User.find_by(name: params[:name])
      unless @user
        @user = User.create(user_params)
      end
      render json: @user
    end

    private

    def user_params
      params.permit(:name)
    end
  end
end
