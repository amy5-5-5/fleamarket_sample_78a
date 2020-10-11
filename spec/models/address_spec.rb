require 'rails_helper'

describe Address do
  context 'ウィザード形式2ページ目（必須事項が埋まっていない時にエラー表示をするか）'do

    it "zipcodeとprefecture,city,streetが存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "zipcodeがない場合は登録できないこと" do
      address = build(:address, zipcode: nil)
      address.valid?
      expect(address.errors[:zipcode]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end
    
    it "streetが無い場合は登録できないこと" do
      address = build(:address, street: nil)
      address.valid?
      expect(address.errors[:street]).to include("を入力してください")
    end

  end
end