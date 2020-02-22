class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :update, :edit, :delete]

  def index
    @playlists = policy_scope(Playlist)
    @user = User.find_by(nickname: params[:user_nickname])
    @playlists = Playlist.where(user_id: @user)
  end

  def show
    @user = current_user
    authorize @playlist

    @p_duration = playlist_duration(@playlist)

    respond_to do |format|
      format.html
      format.js
    end

  end

  def new
    @user = current_user
    @playlist = Playlist.new
    authorize @playlist
  end

  def create
    # @playlist = current_user.playlists.build(playlist_params)
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    authorize @playlist

    if @playlist.save!
      redirect_to user_playlist_path(@playlist.user.nickname, @playlist)
    else
      render :new
    end

  end

  def edit
  end

  def update
    @playlist.update(playlist_params)
  end

  def destroy
    @playlist.destroy
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, :description, :category, :playlist_image)
  end

  def playlist_duration(playlist)
    # if playlist.audios.length > 1
    #   duration = playlist.audios.inject { |sum, n| sum.duration.to_i + n.duration.to_i }
    #   Time.at(duration.to_i).utc.strftime("%Mm%S").sub(/^0/, '') if present?
    # else
    #   duration = playlist.audios.inject { |sum, n| sum.duration.to_i + n.duration.to_i }
    #   Time.at(duration.duration.to_i).utc.strftime("%Mm%S").sub(/^0/, '')
    # end
  end
end
