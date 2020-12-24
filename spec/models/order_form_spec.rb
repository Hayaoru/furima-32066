require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe "購入情報が保存される" do
    before do
      
      @order_form= FactoryBot.build(:order_form)
    end

    context "購入ができる場合" do
      it "正しい情報が入力されれば購入できる" do
        expect(@order_form).to be_valid
      end

      it "建物名が空白でも購入できる" do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
    end

    context "購入ができない場合" do
      it "郵便番号が空の時" do
        @order_form.post_num = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post num can't be blank")
      end

      it "郵便番号にハイフンがない時" do
        @order_form.post_num = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post num is invalid")
      end

      it "都道府県が選択されていない時" do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "市区町村が空の時" do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空の時" do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が空の時" do
        @order_form.phone_num = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num can't be blank")
      end

      it "電話番号にハイフンがある時" do
        @order_form.phone_num = "090-1234-5679"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is invalid")
      end

      it "電話番号が12桁以上の時" do
        @order_form.phone_num = "123456789012"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is invalid")
      end

      it "tokenが空の時" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空の時" do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空の時" do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
