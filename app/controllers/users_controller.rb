class UsersController < ApplicationController
  before_action :set_activities

  def show
    @user = User.find_by(nickname: params[:nickname])
     # authorize @user
    skip_authorization

    @audio = Audio.find(params[:audio]) if params[:audio]
    @url = @audio.audio_url if params[:audio]

    # @fav_playlist = @user.playlits.first

    # @favorites_audio = Audio.find(params[:favorites_audio]) if params[:favorites_audio]

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @user = authorize User.find_by(nickname: params[:nickname])
     # @user = authorize User.new
  end

  def update
    @user = User.find_by(nickname: params[:nickname])
    @user.update!(user_params)
    skip_authorization

    redirect_to user_path(@user)
  end

  def follow
    # @follow = Follow.find_by(follower: @current_user, followable: @user)
    @user = User.find_by(nickname: params[:nickname])
    current_user.follow(@user)
    @user.create_activity :follow, owner: current_user
    skip_authorization

    respond_to :js
  end

  def unfollow
    @user = User.find_by(nickname: params[:nickname])
    current_user.stop_following(@user)
    skip_authorization

    respond_to :js
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :user_bio, :avatar)
  end

  def set_activities
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.following_users.ids)
  end
end
