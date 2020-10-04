class ProfilesController < ApplicationController
  def index
    @profile = Profile.all.order("created_at DESC")
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(create_params)
    if @profile.save
      redirect_to root_path
   else
     render :new
   end
  end

  def show
    @profile = Profile.find(params[:id])
    gon.profile = @profile
  end

private

  def create_params
    params.require(:profile).permit(:image, :name, :explanation, :insta_follower, :insta_man, :insta_woman, :insta_age1, :insta_age2, :insta_age3, :insta_age4, :insta_age5, :insta_age6, :insta_age7, :youtube_follower, :youtube_man, :youtube_woman, :youtube_age1, :youtube_age2, :youtube_age3, :youtube_age4, :youtube_age5, :youtube_age6, :youtube_age7, :viewing, :category_id).merge(user_id: current_user.id)
  end

end

