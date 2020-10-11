require 'rails_helper'

describe User do
  context 'ウィザード形式1ページ目（必須事項が埋まっていない時にエラー表示をするか）'do

    it "nicknameとemail,encrypted_password,family_nameとfirst_name,family_name_furiganaとfirst_name_furriganaが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    
    it "passwordが無い場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationが無い場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "encrypted_passwordが5文字以下では登録できないこと" do
      # binding.pry
      user =build(:user, password: "00000",password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "encrypted_passwordが６文字以上であれば登録できること" do
      user = build(:user, encrypted_password: "000000")
      expect(user).to be_valid
    end

    it "family_nameが無い場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "family_name_furiganaが無い場合は登録できないこと" do
      user =build(:user, family_name_furigana: nil)
      user.valid?
      expect(user.errors[:family_name_furigana]).to include("を入力してください")
    end

    it "first_nameが無い場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
  
    it "first_name_furiganaが無い場合は登録できないこと" do
      user = build(:user, first_name_furigana: nil)
      user.valid?
      expect(user.errors[:first_name_furigana]).to include("を入力してください")
    end

  end
end