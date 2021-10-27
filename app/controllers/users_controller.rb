class UsersController < ApplicationController
    skip_before_action :authorized, only: :create
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
    
    wrap_parameters format: []
    def index   
        render json: User.all
    end

    def show
        current_user = User.find_by(id: session[:user_id])
        render json: current_user
    end

    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    private

    def user_params
        params.permit(:username, :password)
    end

    def unprocessable_entity_response(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity 
    end
end
