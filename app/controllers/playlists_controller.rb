class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :update, :edit, :delete]

  def index
    @playlists = Playlist.all
  end

  def show
  end

  def new
    @user = current_user
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)

    if @playlist.save!
      redirect_to user_playlist(@playlist)
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
    params.require(:playlist).permit(:name, :description)
  end
end
