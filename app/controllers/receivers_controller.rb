class ReceiversController < ApplicationController
  # GET /receivers
  # GET /receivers.json
  def index
    active_menu(2)
    @receivers = Receiver.where("user_id = :user_id",{:user_id => current_user.id.to_s})   
    @receiver = Receiver.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receivers }
    end
  end

  # GET /receivers/1
  # GET /receivers/1.json
  def show
    active_menu(2)
    @receiver = Receiver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receiver }
    end
  end

  # GET /receivers/new
  # GET /receivers/new.json
  def new
    active_menu(2)
    @receiver = Receiver.new  
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @receiver }
    end
  end

  # GET /receivers/1/edit
  def edit
    active_menu(2)
    @receiver = Receiver.find(params[:id])
  end

  # POST /receivers
  # POST /receivers.json
  def create
    active_menu(2)
    @receiver = Receiver.new(params[:receiver])
    @receivers = Receiver.where("user_id = :user_id",{:user_id => current_user.id.to_s})   
    respond_to do |format|
      if @receiver.save
        @receiver.update_attributes(:user_id => current_user.id.to_s)
        @user = User.find(current_user.id.to_s);
        @email = @receiver.email
        @last_name = @user.last_name
        @first_name = @user.first_name
        
        UserMailer.send_mail_receiver(@email,@last_name,@first_name).deliver
        format.html { redirect_to :controller => 'receivers', :action => 'index', notice: 'Receiver was successfully created.' }
        format.json { render json: @receiver, status: :created, location: @receiver }
      else
        format.html { render action: "new" }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /receivers/1
  # PUT /receivers/1.json
  def update
    active_menu(2)
    @receiver = Receiver.find(params[:id])

    respond_to do |format|
      if @receiver.update_attributes(params[:receiver])
        format.html { redirect_to @receiver, notice: 'Receiver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receivers/1
  # DELETE /receivers/1.json
  def destroy
    active_menu(2)
    @receiver = Receiver.find(params[:id])
    @receiver.destroy

    respond_to do |format|
      format.html { redirect_to receivers_url }
      format.json { head :no_content }
    end
  end
  def list
    @receivers = Receiver.all
    respond_to do |format|
      format.js
    end
  end
  def updateReceiver
    active_menu(2)
    if params[:id_receiver] != nil
      @receiver = Receiver.find(params[:id_receiver])
      respond_to do |format|
        if @receiver.update_attributes(:name => params[:name_receiver], :email => params[:email_receiver], :user_id => current_user.id.to_s)
          format.html { redirect_to :controller => 'receivers', :action => 'index', notice: 'Receiver was successfully updated.'}
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to :controller => 'receivers', :action => 'index'}
      end
    end
  end
  def active_menu(num)
    @acitve_dashboard = ""
    @acitve_edit_user = ""
    @acitve_submit_question = ""
    @acitve_infulcen_board = ""
    @active_buttom = ""
    case num
      when 1
        @acitve_dashboard = "activeHeader"
      when 2
        @acitve_edit_user = "activeContent"
      when 3
        @acitve_submit_question = "activeContent"
      when 4
        @acitve_infulcen_board = "activeContent"
      else
        @active_buttom = "activeBottom"
    end
  end
end
