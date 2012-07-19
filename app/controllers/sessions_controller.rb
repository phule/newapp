class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user != nil
      if user.active != 1
        flash[:error] = 'User not active.' # Not quite right!
        render 'new',:flash => flash
      else
        if user && user.authenticate(params[:session][:password])
          # Sign the user in and redirect to the user's show page.
          sign_in user
          #redirect_to user
          redirect_to receivers_path
        else
          # Create an error message and re-render the signin form.
          flash[:error] = 'Invalid email/password combination.' # Not quite right!
          render 'new',:flash => flash
        end
      end
    else
      flash[:error] = 'User not exist.' # Not quite right!
      render 'new',:flash => flash
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
  
  def quickSign
      user = User.find_by_email(params[:sign_name])
      if user != nil
        if user.active != 1
          flash[:error] = 'User not active.' # Not quite right!
          render 'new',:flash => flash
        else
          if user && user.authenticate(params[:sign_pass])
            # Sign the user in and redirect to the user's show page.
            sign_in user
            #redirect_to user
            redirect_to receivers_path
          else
            # Create an error message and re-render the signin form.
            flash[:error] = 'Invalid email/password combination.' # Not quite right!
            redirect_to root_path
          end
        end
      else
        flash[:error] = 'User not exist.' # Not quite right!
        render 'new',:flash => flash
      end
  end
end
