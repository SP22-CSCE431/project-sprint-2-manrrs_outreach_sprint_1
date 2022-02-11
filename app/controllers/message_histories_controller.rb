class MessageHistoriesController < ApplicationController
  before_action :set_message_history, only: %i[ show edit update destroy ]

  # GET /message_histories or /message_histories.json
  def index
    @message_histories = MessageHistory.all
  end

  # GET /message_histories/1 or /message_histories/1.json
  def show
  end

  # GET /message_histories/new
  def new
    @message_history = MessageHistory.new
  end

  # GET /message_histories/1/edit
  def edit
  end

  # POST /message_histories or /message_histories.json
  def create
    @message_history = MessageHistory.new(message_history_params)

    respond_to do |format|
      if @message_history.save
        format.html { redirect_to message_history_url(@message_history), notice: "Message history was successfully created." }
        format.json { render :show, status: :created, location: @message_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_histories/1 or /message_histories/1.json
  def update
    respond_to do |format|
      if @message_history.update(message_history_params)
        format.html { redirect_to message_history_url(@message_history), notice: "Message history was successfully updated." }
        format.json { render :show, status: :ok, location: @message_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_histories/1 or /message_histories/1.json
  def destroy
    @message_history.destroy

    respond_to do |format|
      format.html { redirect_to message_histories_url, notice: "Message history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_history
      @message_history = MessageHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_history_params
      params.require(:message_history).permit(:Message_ID, :Date_Sent, :Student_ID)
    end
end
