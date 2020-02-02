class Api::V1::AudiosController < Api::V1::BaseController
  def index
    @Audios = policy_scope(Audio)
  end
end
