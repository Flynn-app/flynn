class Api::V1::AudiosPlaylistsController < Api::V1::BaseController
  def create
    @audio = Audio.find(params[:audio_id])
    @user = current_user
    @playlist = @user.playlists.first
    @audio_found = AudiosPlaylist.find_by(audio_id: @audio.id, playlist_id: @playlist.id)
    skip_authorization

    if @audio_found.nil?
      @audio_playlist = AudiosPlaylist.new(audio_id: @audio.id, playlist_id: @playlist.id, favorite: true)
      @audio_playlist.save!
    else
      @audio_found.destroy!
    end
  end
end
