class NotesController < ApplicationController
	before_action :set_note, only: [:show, :edit, :update, :destroy]

	def index
		@notes = Note.all
	end

	def new
	end

	def create
		@note = Note.new(note_params)
		@note.save

		redirect_to @note
	end

	def show
		set_note
	end

	def edit
		set_note
	end

	def update
		set_note
		@note.update

		redirect_to @note
	end

	def destroy
		set_note
		@note.destroy
		
		redirect_to @note
	end

	private
	def note_params
		params.require(:note).permit(:title, :text)
	end

	def set_note
		@note = Note.find(params[:id])
	end
end
