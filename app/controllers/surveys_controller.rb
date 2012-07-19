class SurveysController < ApplicationController
  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
    active_menu(1)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = Survey.find(params[:id])
    
    respond_to do |format|
      #format.html # show.html.erb
      #format.json { render json: @survey }
      format.js#  { render }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.json
  def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render json: @survey, status: :created, location: @survey }
      else
        #format.html { render action: "new" }
        #format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.json
  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
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
  
  before_filter :signed_in_user, only: [:index, :edit, :update]
  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, error: "Please sign in."
      end
    end
end
