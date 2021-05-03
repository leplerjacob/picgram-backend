class SessionsController < Devise::SessionsController
    # is where a user will authenticate his/her credentials and it will assign the JWT to the user if successful.
    def create
        user = User.find_by_email(sign_in_params[:email])
        byebug
        if user && user.valid_password?(sign_in_params[:password])
          token = user.generate_jwt
          render json: token.to_json
        else
          render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
    end
end