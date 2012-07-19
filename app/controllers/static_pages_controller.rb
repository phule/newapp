class StaticPagesController < ApplicationController
  def congratulation
  end

  def thankyou
  end

  def home
    #debugger
    @flag = 0
    if params[:email] != nil
      if params[:error] == 1
        @flag = 0
      else
        @flag = 1
      end
      
      #redirect_back_or @user
      @link_active = ""
      @email = params[:email]
      @base_url = ""
      
      #debugger 
      if self.request.port.to_s
        @base_url = "http://" + self.request.host + ":" + self.request.port.to_s
      else
        @base_url = "http://" + self.request.host
      end
      user_exists = StateSignup.find_by_email(@email)
      
      if user_exists == nil
        token = SecureRandom.urlsafe_base64
        @state_signup = StateSignup.new(:email => @email,:active=>0,:token_signup=>token)
        if @state_signup.save
          token = @state_signup.token_signup
          @link_signup = @base_url + active_path+'?token='+token
          UserMailer.send_mail_signup(@email,@link_signup,@base_url).deliver
          redirect_to root_path(:suc=>@flag)
        else
          @state_signup.errors
          redirect_to root_path(:error=>"1")
        end
      else
        redirect_to root_path(:error=>"1")
      end
    end
  end

  def help
    User.delete_all
    Receiver.delete_all
    StateSignup.delete_all
  end
  def about
  end

  def contact
  end
end