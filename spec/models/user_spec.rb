require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "正常に新規登録できる" do
      binding.pry
      @user.valid?
      expect(@user).to be_valid
    end

    it "nameが空だと登録できない" do
      @user.name = ""
      @user.valid?
       expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  
    it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに＠がないと登録できない" do
      @user.email="ufdhauifdad.ds.com"
      @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが半角数字のみだと登録できない" do
      @user.password = "777777777776"
      @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが半角英字のみだと登録できない" do
      @user.password = "qwertyuiopasdfg"
      @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが6文字より少ないと登録できない" do
      @user.password = Faker::Internet.password(min_length:5,max_length: 5)
      @user.password_confirmation = @user.password
      @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationは値が同じでないと登録出来ない" do
      @user.password_confirmation = Faker::Internet.password(min_length: 6)
      @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "last_nameが空だと登録できない" do
      @user.last_name=""
      @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end

    it "first_nameが空だと登録できない" do
      @user.first_name=""
      @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana=""
      @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana=""
      @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
    end

    it "first_nameが半角英字のみだと登録できない" do
      @user.first_name="a"
      @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_nameが半角英字のみだと登録できない" do
      @user.last_name="a"
      @user.valid?
       expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_nameが半角数字のみだと登録できない" do
      @user.first_name="1"
      @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_nameが半角数字のみだと登録できない" do
      @user.last_name="2"
      @user.valid?
       expect(@user.errors.full_messages).to include("Last name is invalid")
    end


    it "last_name_kanaが全角カナでないと登録できない" do
      @user.last_name_kana="あ"
      @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "first_name_kanaが全角カナでないと登録できない" do
      @user.first_name_kana="あ"
      @user.valid?
       expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "birthdayが空だと登録できない" do
      @user.birthday=""
      @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
