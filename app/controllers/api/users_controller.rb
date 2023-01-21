module Api
  class UsersController < ActionController::API
    def show
      @user = User.find_by(name: params[:name])
      render json: @user
    end
  end
end
