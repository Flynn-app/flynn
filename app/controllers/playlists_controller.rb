class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :update, :edit, :delete]

  def index
    @playlists = Playlist.all
    authorize @playlists
  end

  def show
    # @user = current_user
    authorize @playlist
  end

  def new
    @user = current_user
    @playlist = Playlist.new
    authorize @playlist
  end

  def create
    # @playlist = current_user.playlists.build(playlist_params)
    @playlist = Playlist.new(playlist_params)
    @user = User.find(params[:user_id])
    @playlist.user = @user

    # @playlist.user = current_user
    authorize @playlist

    if @playlist.save
      redirect_to user_playlist_path(@user, @playlist)
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
    params.require(:playlist).permit(:name, :description, :category)
  end
end
