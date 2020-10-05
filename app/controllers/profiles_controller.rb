class ProfilesController < ApplicationController
  def index
    @profile = Profile.all.order("created_at DESC")
    @music = Profile.where(category_id: 2)
    @beauty = Profile.where(category_id: 3)
    @cook = Profile.where(category_id: 4)
    @education = Profile.where(category_id: 5)
    @business = Profile.where(category_id: 6)
    @event = Profile.where(category_id: 7)
    @sports = Profile.where(category_id: 8)
    @interior = Profile.where(category_id: 9)
    @game = Profile.where(category_id: 10)
    @other = Profile.where(category_id: 11)
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

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(update_params)
       redirect_to profile_path
    else
       render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    if @profile.delete
       redirect_to root_path
    else
      render :show
    end
  end

private

  def create_params
    params.require(:profile).permit(:image, :name, :explanation, :insta_follower, :insta_man, :insta_woman, :insta_age1, :insta_age2, :insta_age3, :insta_age4, :insta_age5, :insta_age6, :insta_age7, :youtube_follower, :youtube_man, :youtube_woman, :youtube_age1, :youtube_age2, :youtube_age3, :youtube_age4, :youtube_age5, :youtube_age6, :youtube_age7, :viewing, :category_id).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:profile).permit(:image, :name, :explanation, :insta_follower, :insta_man, :insta_woman, :insta_age1, :insta_age2, :insta_age3, :insta_age4, :insta_age5, :insta_age6, :insta_age7, :youtube_follower, :youtube_man, :youtube_woman, :youtube_age1, :youtube_age2, :youtube_age3, :youtube_age4, :youtube_age5, :youtube_age6, :youtube_age7, :viewing, :category_id).merge(user_id: current_user.id)
  end

end

