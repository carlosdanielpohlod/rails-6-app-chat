class MessagesController < ApplicationController
  #before_action :set_message, only: %i[ show edit update destroy ]
  respond_to :json

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)
    
    #ActionCable.server.broadcast 'room_channel', {:content=>@message.content, :sender_name=>@user.name}
    respond_to do|format|
      format.json {head :no_content, status: :created}
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.permit(:content, :room_id)
    end
end
