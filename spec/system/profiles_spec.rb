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

RSpec.describe '編集', type: :system do
  before do
    @profile1 = FactoryBot.create(:profile)
    @profile2 = FactoryBot.create(:profile)
  end
  context '編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したアカウントの編集ができる' do
      # profile1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'user_email', with: @profile1.user.email
      fill_in 'user_password', with: @profile1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 詳細ページへ遷移する
      visit profile_path(@profile1)
      # profile1に「編集」ボタンがあることを確認する
      expect(page).to have_content('アカウント編集')
      # 編集ページへ遷移する
      visit edit_profile_path(@profile1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#explanation').value
      ).to eq @profile1.explanation
      # 投稿内容を編集する
      fill_in 'explanation',with: "#{@profile1.explanation}+編集したテキスト"
      # 編集してもProfileモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
        }.to change { Profile.count }.by(0)
      # 詳細ページに遷移する
      visit profile_path(@profile1)
      # 詳細ページには先ほど変更した内容のツイートが存在することを確認する（テキスト）
      expect(page).to have_content("#{@profile1.explanation}+編集したテキスト")
    end
  end
  context '編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したプロフィールの編集画面には遷移できない' do
      # profile1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'user_email', with: @profile1.user.email
      fill_in 'user_password', with: @profile1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # プロフィール2の詳細ページへ遷移する
      visit profile_path(@profile2)
      # 編集ページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('アカウント編集')
    end
    it 'ログインしていないとプロフィールの編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # 詳細ページへ遷移する
      visit profile_path(@profile1)
      # profile1に「編集」ボタンがないことを確認する
      expect(page).to have_no_content('アカウント編集')
      # トップページに戻る
      visit root_path
      # 詳細ページへ遷移する
      visit profile_path(@profile2)
      # profile2に「編集」ボタンがないことを確認する
      expect(page).to have_no_content('アカウント編集')
    end
  end
end
