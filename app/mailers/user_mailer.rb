class UserMailer < ActionMailer::Base
  default from: "tinypulse@gmail.com"
  def welcome_email(user,link_active)
    @user = user
    @url  = link_active
    mail(:to => user.email, :subject => "Welcome to Tiny Pulse Site")
  end
  def cron_send_email
    @users = User.where("active = :active",{:active=>"1"})
    @email = []
    if @users!= nil
      @users.each do|user|
        @email.push(user.email)
        @receivers = Receiver.where("user_id = :user_id",{:user_id => user.id.to_s})
        if @receivers != nil
          @receivers.each do |receiver|
            @email.push(receiver.email)
          end
        end
      end
      if @email.count > 0  
        mail(:to => @email, :subject => "Test Cron jobs")
      end
    end  
  end
  def send_mail_signup (email,url,base_url)
    @url = url
    @email = email
    @base_url = base_url+"/assets/btnComplete.png"
    mail(:to =>@email, :subject => "Welcome to TinyPulse")
  end
  def send_mail_receiver(email,last_name,first_name)
    @full_name = first_name+' '+last_name
    mail(:to =>email, :subject => "Welcome to TinyPulse")
  end
end
