class RegistrationsController < Devise::RegistrationsController
# is where a user will create his/her credentials, and it will assign the JWT to the user once complete.

# The reason we need to have our own controller is so that we can have the user instance build its token for the controller to deliver it. On the client side, we would use this returned token to store in a httpOnly cookie, (or whatever other storage option you prefer).

  def create
      user = User.new(sign_up_params)
      # byebug
      if user.save
      token = user.generate_jwt
        render json: token.to_json
      else
        render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
      end
  end
end
