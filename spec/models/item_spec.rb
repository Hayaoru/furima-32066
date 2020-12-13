require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/apple-touch-icon.png')
  end

  describe '商品出品登録' do
    it '正常に新規登録できる' do
      expect(@item).to be_valid
    end

    it '商品画像が空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空だと登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it '商品説明が空だと登録できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'カテゴリー情報を選択肢しないと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態を選択しないと登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it '送料の負担を選択しないと登録できない' do
      @item.ship_value_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship value must be other than 1')
    end

    it '発送元のエリアを選択しないと登録できない' do
      @item.ship_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship area must be other than 1')
    end

    it '発送までの日数を選択しないと登録できない' do
      @item.ship_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship day must be other than 1')
    end

    it '価格を入力しないと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格範囲が299以下だと登録できない' do
      @item.price = 12
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格範囲が10,000,000以上だと登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '価格は半角数字でないと登録できない' do
      @item.price = 'あ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
