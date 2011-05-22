class QuestionsController < ApplicationController

	before_filter :authenticate_user!

  # GET /questions
  # GET /questions.xml
  def index
    @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
    @question = Question.new
		@question.answers.build
    @question.images.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
		@question = Question.find(params[:id])
		authorize! :edit, @question
		
  end

  # POST /questions
  # POST /questions.xml
  def create

  #here the user_id is inserted in every answer
  #the question_id is inserted via the nested attributes
	params[:question][:answers_attributes].keys.each {|key| params[:question][:answers_attributes][key][:user_id] = current_user.id }

 
	
	
  #here the question_id and the user_id is inserted in every question
  params[:question][:user_id]=current_user.id

    @question = Question.new(params[:question])

		#@question.user = current_user

    respond_to do |format|
      if @question.save
        p params
        if params[:question][:images].blank? 
          format.html { redirect_to(@question, :notice => 'Question was successfully created.') }
          format.xml  { render :xml => @question, :status => :created, :location => @question }
          #render :action => "images/crop" 
        else
          #render :action => "images/crop" 
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    
#here the user_id is inserted in every answer
  #the question_id is inserted via the nested attributes
	params[:question][:answers_attributes].keys.each {|key| params[:question][:answers_attributes][key][:user_id] = current_user.id }
	
	
  #here the question_id and the user_id is inserted in every question
  params[:question][:user_id]=current_user.id

    @question = Question.find(params[:id])
		authorize! :update, @question
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to(@question, :notice => 'Question was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
		
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = Question.find(params[:id])
		authorize! :destroy, @question
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end

  


end
