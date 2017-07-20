class NotesController < ApplicationController
    #before_action :set_note, only: [:]
    def index
        @result = Note.all.order("ID ASC")
    end
    def show
        begin
            @id = params[:id]
            @result = Note.find(@id)
        rescue ActiveRecord::RecordNotFound => e
             @result = nil
        end
        #puts @result.inspect
    end
    def new
        @note = Note.new
        #puts @note.inspect
    end
    def note_params
        params.require(:note).permit(:title, :content)
    end
    def create
        #ajout de la note dans la bd
        @note = Note.new(note_params)
        @note.user = User.last
        if @note.save
            flash[:notice] = 'La note a été créée'
            redirect_to notes_path
        else
            puts @note.errors.inspect
            render 'new' 
        end
        #redirect_to notes_path
    end
    def set_note
        @note = Note.find(params[:id])
    end
end
