class Users::RegistrationsController < Devise::RegistrationsController
  # POST /users
  def create
    build_resource(sign_up_params)

    # Don't show error until the form is submitted
    if request.post?
      # Check for empty fields before saving the resource
      if resource.email.blank? || resource.password.blank? || resource.username.blank?
        flash[:error] = "Please fill in all fields."
        render :new and return
      end

      # Custom password length check (password must be at least 6 characters)
      if resource.password.length < 6
        flash[:error] = "Password must be at least 6 characters."
        render :new and return
      end

      if resource.save
        # Successfully saved user, redirect to root or dashboard
        sign_in(resource_name, resource)
        redirect_to root_path
      else
        flash[:error] = "There were problems with your sign-up"
        render :new
      end
    end
  end
end
