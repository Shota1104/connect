class ProfileController < ApplicationController
  def index
  end

  def create
    @profile = Profile.new(create_params)
    if @item.save
      redirect_to root_path
   else
     render :new
   end
  end


private

  def create_params
    params.required(:profile).permit(:image, :name, :explanation, :insta_follower, :insta_gender, :insta_age, :youtube_gender, :youtube_age, :viewing, :categoy_id, :user_id).merge(user_id: current_user.id)
  end

end
