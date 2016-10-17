class NotesController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  

  include ApplicationHelper
  def top
  end
  def about
  end
  def new
    @note = Note.new
  end

  def create
  	@note = Note.new(note_params)
    @note.user_id = current_user.id
    # @note.save
    # redirect_to note_path(@note.id)
    respond_to do |format|
    if @note.save
      format.html { redirect_to notes_url, notice: 'Note was successfully created.' }
      format.json { render :show, status: :created, location: @note }
    else
      @notes = Note.all
      format.html { render :index }
      format.json { render json: @note.errors, status: :unprocessable_entity }
    end
  end
  end
  def index
  	@notes = Note.all
    @notes = Note.page(params[:page]).per(10)
  end

  def show
  	@note = Note.find(params[:id])
  end
 
  def edit
  	@note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
  	if @note.update(note_params)
    redirect_to note_path(@note.id)
    else 
      render :edit
    end
  end
  
  def destroy
  	@note = Note.find(params[:id])
  	@note.destroy
  	redirect_to notes_path
  end
   private
        def note_params
          params.require(:note).permit(:title, :content, :image, :interest_list)
        end

        def correct_user
          note = Note.find(params[:id])
          if current_user.id != note.user.id
          redirect_to root_path
          end
        end
        
end
