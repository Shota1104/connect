require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'ユーザーアカウント登録' do
    before do
      @profile = FactoryBot.build(:profile)
    end
    context '登録がうまくいくとき' do
      it 'nameとexplanation、image,insta_follower,insta_man,insta_woman_insta_age1,insta_age2,insta_age3,insta_age4,insta_age5,insta_age6,insta_age7、insta_reach,insta_impression,insta_clickが存在すれば登録できる' do
        expect(@profile).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @profile.name = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('アカウント名を入力してください')
      end
      it 'アカウント説明が空だと登録出来ない' do
        @profile.explanation = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('アカウントの説明を入力してください')
      end
      it '画像が空だと登録出来ない' do
        @profile.image = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include('画像を入力してください')
      end
      it 'フォロワーが空だと登録出来ない' do
        @profile.insta_follower = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('フォロワーを入力してください')
      end
      it 'フォロワーが5桁未満だと登録出来ない' do
        @profile.insta_follower = '9999'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('フォロワーは不正な値です')
      end
      it '男性比率が空だと登録出来ない' do
        @profile.insta_man = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('男性比率を入力してください')
      end
      it '男性比率が数値以外だと登録出来ない' do
        @profile.insta_man = 'aaa'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('男性比率は数値で入力してください')
      end
      it '女性比率が空だと登録出来ない' do
        @profile.insta_woman = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('女性比率を入力してください')
      end
      it '女性比率が数値以外だと登録出来ない' do
        @profile.insta_woman = 'aaa'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('女性比率は数値で入力してください')
      end
      it '13-17才が空だと登録出来ない' do
        @profile.insta_age1 = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('13-17才の構成比を入力してください')
      end
      it '13-17才が数値以外だと登録出来ない' do
        @profile.insta_age1 = 'aaa'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('13-17才の構成比は数値で入力してください')
      end
      it '18-24才が空だと登録出来ない' do
        @profile.insta_age2 = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('18-24才の構成比を入力してください')
      end
      it '18-24才が数値以外だと登録出来ない' do
        @profile.insta_age2 = 'aaa'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('18-24才の構成比は数値で入力してください')
      end
      it '25-34才が空だと登録出来ない' do
        @profile.insta_age3 = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('25-34才の構成比を入力してください')
      end
      it '25-34才が数値以外だと登録出来ない' do
        @profile.insta_age3 = 'aaa'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('25-34才の構成比は数値で入力してください')
      end
      it '35-44才が空だと登録出来ない' do
        @profile.insta_age4 = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('35-44才の構成比を入力してください')
      end
      it '35-44才が数値以外だと登録出来ない' do
        @profile.insta_age4 = 'aaa'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('35-44才の構成比は数値で入力してください')
      end
      it '45-54才が空だと登録出来ない' do
        @profile.insta_age5 = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('45-54才の構成比を入力してください')
      end
      it '45-54才が数値以外だと登録出来ない' do
        @profile.insta_age5 = 'aaa'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('45-54才の構成比は数値で入力してください')
      end
      it '55-64才が空だと登録出来ない' do
        @profile.insta_age6 = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('55-64才の構成比を入力してください')
      end
      it '55-64才が数値以外だと登録出来ない' do
        @profile.insta_age6 = 'aaa'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('55-64才の構成比は数値で入力してください')
      end
      it '65才以上が空だと登録出来ない' do
        @profile.insta_age7 = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include('65+才の構成比を入力してください')
      end
      it '65才以上が数値以外だと登録出来ない' do
        @profile.insta_age7 = 'aaa'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('65+才の構成比は数値で入力してください')
      end
      it 'youtubeフォロワーが5桁未満だと登録出来ない' do
        @profile.insta_follower = '9999'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('フォロワーは不正な値です')
      end
      it 'twitterフォロワーが4桁未満だと登録出来ない' do
        @profile.insta_follower = '999'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('フォロワーは不正な値です')
      end
    end
  end
end
