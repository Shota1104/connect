require 'rails_helper'
RSpec.describe "メッセージ投稿機能", type: :system do
  before do
    # 中間テーブルを作成して、usersテーブルとroomsテーブルのレコードを作成する
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
    @room_user = FactoryBot.create(:room_user)
  end
  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # ログインする
      sign_in(@user)
      # チャットルーム作成ページへ遷移
      visit new_room_path
      # ルーム名入力
      fill_in 'room_name',with: @room.name
      # ユーザー選択
      select 'fox',from:'room[user_ids][]'
      # 登録するとroomモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change {Room.count}.by(1)
      # トップページへ遷移
      visit root_path
      #チャットルーム作成ページへ遷移
      visit new_room_path
      #チャットルーム一覧ページへ遷移
      visit rooms_path
      # 作成されたチャットルームへ遷移する
      click_on(@room.name)
      # 値をテキストフォームに入力する
      post = "テスト"
      fill_in 'message_content', with: post
      # 送信した値がDBに保存されていることを確認する
      expect {find('input[name="commit"]').click}.to change { Message.count }.by(1)
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)
    end
  end
  context '投稿に失敗したとき' do
    it '送る値が空の為、メッセージの送信に失敗すること' do
      # サインインする
      sign_in(@user)
      # チャットルーム作成ページへ遷移
      visit new_room_path
      # ルーム名入力
      fill_in 'room_name',with: @room.name
      # ユーザー選択
      select 'fox',from:'room[user_ids][]'
      # 登録するとroomモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change {Room.count}.by(1)
      # トップページへ遷移
      visit root_path
      #チャットルーム作成ページへ遷移
      visit new_room_path
      #チャットルーム一覧ページへ遷移
      visit rooms_path
      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)
      # DBに保存されていないことを確認する
      expect {find('input[name="commit"]').click}.not_to change { Message.count }
    end
    it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      # サインインする
      sign_in(@user)
      # チャットルーム作成ページへ遷移
      visit new_room_path
      # ルーム名入力
      fill_in 'room_name',with: @room.name
      # ユーザー選択
      select 'fox',from:'room[user_ids][]'
      # 登録するとroomモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change {Room.count}.by(1)
      # トップページへ遷移
      visit root_path
      #チャットルーム作成ページへ遷移
      visit new_room_path
      #チャットルーム一覧ページへ遷移
      visit rooms_path
      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('message[image]', image_path, make_visible: true)
      # 送信した値がDBに保存されていることを確認する
      expect {find('input[name="commit"]').click}.to change { Message.count }.by(1)
      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector("img")
    end

    it 'テキストと画像の投稿に成功すること' do
      # サインインする
      sign_in(@user)
      # チャットルーム作成ページへ遷移
      visit new_room_path
      # ルーム名入力
      fill_in 'room_name',with: @room.name
      # ユーザー選択
      select 'fox',from:'room[user_ids][]'
      # 登録するとroomモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change {Room.count}.by(1)
      # トップページへ遷移
      visit root_path
      #チャットルーム作成ページへ遷移
      visit new_room_path
      #チャットルーム一覧ページへ遷移
      visit rooms_path
      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('message[image]', image_path, make_visible: true)
      # 値をテキストフォームに入力する
      post = "テスト"
      fill_in 'message_content', with: post
      # 送信した値がDBに保存されていることを確認する
      expect {find('input[name="commit"]').click}.to change { Message.count }.by(1)
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)
      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector("img")
    end
  end
end
