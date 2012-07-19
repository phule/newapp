class StateSignupsController < ApplicationController
  # GET /state_signups
  # GET /state_signups.json
  def index
    @state_signups = StateSignup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @state_signups }
    end
  end

  # GET /state_signups/1
  # GET /state_signups/1.json
  def show
    @state_signup = StateSignup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @state_signup }
    end
  end

  # GET /state_signups/new
  # GET /state_signups/new.json
  def new
    @state_signup = StateSignup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @state_signup }
    end
  end

  # GET /state_signups/1/edit
  def edit
    @state_signup = StateSignup.find(params[:id])
  end

  # POST /state_signups
  # POST /state_signups.json
  def create
    @state_signup = StateSignup.new(params[:state_signup])

    respond_to do |format|
      if @state_signup.save
        format.html { redirect_to @state_signup, notice: 'State signup was successfully created.' }
        format.json { render json: @state_signup, status: :created, location: @state_signup }
      else
        format.html { render action: "new" }
        format.json { render json: @state_signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /state_signups/1
  # PUT /state_signups/1.json
  def update
    @state_signup = StateSignup.find(params[:id])

    respond_to do |format|
      if @state_signup.update_attributes(params[:state_signup])
        format.html { redirect_to @state_signup, notice: 'State signup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @state_signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_signups/1
  # DELETE /state_signups/1.json
  def destroy
    @state_signup = StateSignup.find(params[:id])
    @state_signup.destroy

    respond_to do |format|
      format.html { redirect_to state_signups_url }
      format.json { head :no_content }
    end
  end
  def confirm_signup
    @token = params[:token];
    @state_signup = StateSignup.where("token_signup = :token",{:token =>@token})
    
    if @state_signup !=nil
      if  @state_signup[0]!=nil
        @state_signup[0].update_attribute(:active,1)
        email = @state_signup[0].email
        redirect_to signup_path(:email => email)
      else
        redirect_to thankyou_path
      end
    end 
  end
end
