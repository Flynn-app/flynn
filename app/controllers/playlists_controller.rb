class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :update, :edit, :delete]

  def index
    @playlists = policy_scope(Playlist)
    @user = User.find_by(nickname: params[:user_nickname])
    @playlists = Playlist.where(user_id: @user)
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
end
