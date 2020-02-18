class Api::V1::AudiosPlaylistsController < Api::V1::BaseController


  def create
    @audio = Audio.find(params[:audio_id])
    @playlist = @audio.user.playlists.first
    @audioplaylist = AudiosPlaylist.new(audio_id: @audio.id, playlist_id: @playlist.id)


    @audioplaylist.save!
    # binding.pry

    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

end
