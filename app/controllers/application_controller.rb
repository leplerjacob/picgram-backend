class ApplicationController < ActionController::API

    # is where we will process a JWT when a user sends a request to our API. It's vital to keep in mind that the Application Controller is not concerned with credentials - it simply checks for a valid JWT.

    respond_to :json

    private

    def authenticate_user!(options ={})
        head :unauthorized unless signed_in?
    end

    def signed_in?
        @current_user_id.present?
    end

    def current_user
        @current_user ||= super || User.find(@current_user_id)
    end

    def process_token
        if request.headers['Authorization'].present?
            begin
            jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1].remove('"'), Rails.application.secrets.secret_key_base).first
            @current_user_id = jwt_payload['id']
            rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
                head :unauthorized
            end
        end
    end

    # Ended right before adding "before_action :process_token"
end
