class Users::SessionsController < Devise::SessionsController
  # POST /users/sign_in
  def create
    if request.post?
      # Check if fields are empty before proceeding
      if params[:user][:email].blank? || params[:user][:password].blank?
        flash[:error] = "Please fill in all fields."
        render :new and return
      end

      # Authenticate the user (handled by Devise's warden)
      self.resource = warden.authenticate!(auth_options)

      # If authentication failed (invalid email or password)
      if resource.nil?
        flash[:error] = "Invalid email or password"
        render :new
      else
        sign_in(resource_name, resource)
        redirect_to root_path
      end
    end
  end
end
