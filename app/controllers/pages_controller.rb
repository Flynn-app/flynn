class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @text_to_synthesize = "allez allez l'olympique lyonnais"
    @audio_file = SynthesizeText.new(@text_to_synthesize).synthesize_text
  end
end
