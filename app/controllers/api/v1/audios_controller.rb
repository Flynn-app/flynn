class Api::V1::AudiosController < Api::V1::BaseController
  before_action :set_audio, only: [ :show ]

  def index
    @audios = policy_scope(Audio)
  end

  private

  def set_audio
    @audio = Audio.find(params[:id])
    authorize @audio
  end

end
