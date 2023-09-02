class SessionsController < ApplicationController
    def create 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id 
            render json: user 
        else

            errors = []
            if user.nil?
                errors << 'invalid password'
            else
                errors << 'invalid username'
            end
            render json: { errors: errors }, status: :unauthorized 
        end
    end

    def destroy      
       if logged_in?
        session.delete :user_id
        head :no_content 
       else
        errors = ['Not logged in']
        render json: { errors: errors }, status: :unauthorized
       end

    end

    private 
    def logged_in? 
        !session[:user_id].nil?
    end
end
