class ProfilesController < ApplicationController
  before_action :search_product, only: [:index, :show, :search]

  def index
    @profile = Profile.all.order('created_at DESC')
    @music = Profile.where(category_id: 2).order('created_at DESC')
    @beauty = Profile.where(category_id: 3).order('created_at DESC')
    @cook = Profile.where(category_id: 4).order('created_at DESC')
    @education = Profile.where(category_id: 5).order('created_at DESC')
    @business = Profile.where(category_id: 6).order('created_at DESC')
    @event = Profile.where(category_id: 7).order('created_at DESC')
    @sports = Profile.where(category_id: 8).order('created_at DESC')
    @interior = Profile.where(category_id: 9).order('created_at DESC')
    @game = Profile.where(category_id: 10).order('created_at DESC')
    @other = Profile.where(category_id: 11).order('created_at DESC')
    set_product_column
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
    set_product_column
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

  def search
    @results = @p.result
  end

  private

  def create_params
    params.require(:profile).permit(:image, :name, :explanation, :insta_follower, :insta_man, :insta_woman, :insta_age1, :insta_age2, :insta_age3, :insta_age4, :insta_age5, :insta_age6, :insta_age7, :insta_reach, :insta_impression, :insta_click, :youtube_follower, :youtube_man, :youtube_woman, :youtube_age1, :youtube_age2, :youtube_age3, :youtube_age4, :youtube_age5, :youtube_age6, :youtube_age7, :viewing, :audience, :youtube_impression, :twitter_follower, :twitter_man, :twitter_woman, :twitter_age1, :twitter_age2, :twitter_age3, :twitter_age4, :twitter_age5, :twitter_age6, :twitter_age7, :twitter_impression, :twitter_engagement, :twitter_click, :category_id).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:profile).permit(:image, :name, :explanation, :insta_follower, :insta_man, :insta_woman, :insta_age1, :insta_age2, :insta_age3, :insta_age4, :insta_age5, :insta_age6, :insta_age7, :insta_reach, :insta_impression, :insta_click, :youtube_follower, :youtube_man, :youtube_woman, :youtube_age1, :youtube_age2, :youtube_age3, :youtube_age4, :youtube_age5, :youtube_age6, :youtube_age7, :viewing, :audience, :youtube_impression, :twitter_follower, :twitter_man, :twitter_woman, :twitter_age1, :twitter_age2, :twitter_age3, :twitter_age4, :twitter_age5, :twitter_age6, :twitter_age7, :twitter_impression, :twitter_engagement, :twitter_click, :category_id).merge(user_id: current_user.id)
  end

  def search_product
    @p = Profile.ransack(params[:q])
  end

  def set_product_column
    @profile_category = Profile.select('category_id').distinct
  end
end
