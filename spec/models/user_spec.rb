require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context "新規登録がうまくいくとき" do
      it "全ての値が正しく入力されていていれば登録できること" do
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "ニックネームが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "emailに@がない場合登録できない" do
        @user.email = "hoge hoge.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが7文字以下であれば登録はできない" do
        @user.password = "0000000"
        @user.password_confirmation = "0000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは8文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordは半角英数字混合でないと登録できない" do
        @user.password = "A１A１A１A"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      
    end
  end

end
