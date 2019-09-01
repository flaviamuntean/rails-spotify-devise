class AudiosController < ApplicationController
  def create
    @audio = Audio.new(audio_params)
    @audio.user = current_user
    if @audio.save
      # set_flash_message(:notice, :success)
      redirect_to user_audio_path(current_user), notice: "Song added!"
    else
      @user = current_user
      @audios = Audio.where(user_id: params[:user_id]).order(created_at: :DESC)
      # render 'users/audio', user_id: current_user
      redirect_to user_audio_path(current_user), alert: "You've already added that song. Try another one!"
    end
  end

  private

  def audio_params
    params.require(:audio).permit(:link, :uid, :user_id)
  end
end
