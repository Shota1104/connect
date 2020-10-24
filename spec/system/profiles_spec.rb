require 'rails_helper'

RSpec.describe "アカウント登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.build(:profile)
  end
  context 'アカウント登録ができるとき' do 
    it '正しい情報を入力すればアカウント登録ができてトップページに移動する' do
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 登録ページへのリンクがあることを確認する
      expect(page).to have_content('登録')
      # 登録ページに移動する
      visit new_profile_path
      # フォームに情報を入力する
      attach_file("item-image",'public/images/test_image.png')
      fill_in 'name', with: @profile.name
      fill_in 'explanation', with: @profile.explanation
      select '音楽',from: "profile_category_id"
      fill_in 'insta_follower', with: @profile.insta_follower
      fill_in 'insta_man', with: @profile.insta_man
      fill_in 'insta_woman', with: @profile.insta_woman
      fill_in 'insta_age1', with: @profile.insta_age1
      fill_in 'insta_age2', with: @profile.insta_age2
      fill_in 'insta_age3', with: @profile.insta_age3
      fill_in 'insta_age4', with: @profile.insta_age4
      fill_in 'insta_age5', with: @profile.insta_age5
      fill_in 'insta_age6', with: @profile.insta_age6
      fill_in 'insta_age7', with: @profile.insta_age7
      fill_in 'insta_impression', with: @profile.insta_impression
      fill_in 'insta_reach', with: @profile.insta_reach
      fill_in 'insta_click', with: @profile.insta_click
      # 送信するとprofileモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Profile.count }.by(1)
      # トップページに遷移する
      visit root_path
      # トップページには先ほど投稿した内容が存在することを確認する（画像）
      # find(".image-content").click
      # expect(page).to have_content ('M.kitchen')
      # expect(page).to have_selector ".profile-image['public/images/test_image.png']"
      # expect("page").to have_link 'M.kitchen', href: "profile"
      # expect(page).to have_selector ".profile-image[src#{public/images/test_image.png}]"
    end
  end
  context 'アカウント登録ができないとき' do
    it '誤った情報ではアカウント登録ができずに新規登録ページへ戻ってくる' do
      # トップページに遷移する
      visit root_path
      # 登録ページへのリンクがない
      expect(page).to have_no_content('登録')
    end
  end
end

