class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, except: :index
  def index
    @users = User.all
  end

  def show
    youtube
  end

  def bio
    @bio = @user.bio
  end

  def audio
    soundcloud
  end

  def influences
    fetch_spotify_details if @user.spotify_credentials
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def fetch_spotify_details
    @spotify_user = RSpotify::User.new(eval(@user.spotify_credentials))
    @top_artists = @spotify_user.top_artists(time_range: 'long_term') #=> (Artist array)
    @top_tracks = @spotify_user.top_tracks(time_range: 'long_term') #=> (Track array)
    genres = @top_artists.map(&:genres).flatten
    @genres = Hash[genres.uniq.map{ |i| [i, genres.count(i)] }].sort_by {|_key, value| value}.reverse
    # Check doc for more
    @player = RSpotify::Player.new(@spotify_user)
  end

  def youtube
    @video = Video.new
    @videos = Video.where(user_id: params[:id]).order(created_at: :DESC)
  end

  def soundcloud
    @audio = Audio.new
    @audios = Audio.where(user_id: params[:id]).order(created_at: :DESC)
  end
end
