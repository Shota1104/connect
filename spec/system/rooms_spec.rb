require 'rails_helper'
RSpec.describe "ルーム作成", type: :system do
  before do
    # driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @room = FactoryBot.build(:room)
  end
  context 'ルームを作成できるとき' do
    it 'ログインしたユーザーは自分以外のユーザーが存在する時、ルームを作成する事ができる' do
    #ログインする
    sign_in(@user)
    #チャットルーム作成ページへ遷移
    visit new_room_path
    #ルーム名入力
    fill_in 'room_name',with: @room.name
    #ユーザー選択
    select 'test',from:'room[user_ids][]'
    #登録するとroomモデルのカウントが1上がることを確認する
    expect{find('input[name="commit"]').click}.to change {Room.count}.by(1)
    #トップページへ遷移
    visit root_path
    end
  end
  context 'ルームが作成できないとき' do
    it 'ログインしていないとルームを作成できない' do
      #トップページにいる
      visit root_path
      #チャットページのリンクがない
      expect(page).to have_no_content('チャット')
    end
  end
end
