require 'lib/has_access'

class NotesController < ApplicationController
  include HasAccess
  before_filter :authenticate!
  before_filter :has_access?

  def create
    note = Note.new note_ajax_params[:note]
    render json: { success: note.save, message: note.save_message }
  end

  def update
    note = Note.find params[:id]
    note.update note_ajax_params[:note]
    render json: { success: note.save, message: note.save_message }
  end

  protected

  def note_ajax_params
    params.permit(note: [:user_id, :proposal_id, :content])
  end

end
