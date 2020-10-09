require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    @post.image = fixture_file_upload('app/assets/images/camp_tent.png')
  end
  describe '投稿機能' do
    context "投稿機能がうまくいくとき" do
      it "全ての値が正しく入力されていていれば登録できること" do
        expect(@post).to be_valid
      end
    end
    context "投稿機能がうまくいかないとき" do
      it "画像が空だったら登録できない" do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("画像を選択してください")
      end
      it "アイテム名が空では登録できない" do
        @post.name = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("アイテム名を入力してください")
      end
      it "説明が空では登録できない" do
        @post.description = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("説明欄を入力してください")
      end
      it "カテゴリーの情報が空では登録できない" do
        @post.category_id = 0
        @post.valid?
        expect(@post.errors.full_messages).to include("カテゴリーは' --- '以外を選択してください")
      end
      it "価格の情報が空では登録できない" do
        @post.price = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("値段を入力してください")
      end


    end

  end
end
