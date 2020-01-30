class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    text_to_synthesize = "super text à transcrire"
    audio_file = SynthesizeService.new(text_to_synthesize)
  end
end
