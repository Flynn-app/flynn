class Api::V1::AudiosController < Api::V1::BaseController
  def index
    @audios = policy_scope(Audio)
  end
end
