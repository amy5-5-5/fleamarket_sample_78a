require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      it 'brandが無くても保存できる、priceが半角数字であれば保存できる' do
        item = FactoryBot.build(:item, brand: nil)
        expect(item).to be_valid
      end

      it 'nameが40文字以下だと保存できる' do
        item = FactoryBot.build(:item, name: '０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９')
        expect(item).to be_valid
      end
    end

    context 'can not save' do
      it 'nameが無いと保存できない' do
        item = FactoryBot.build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it 'nameが41文字以上だと保存できない' do
        item = FactoryBot.build(:item, name: '０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０')
        item.valid?
        expect(item.errors[:name]).to include("は40文字以内で入力してください")
      end

      it 'textが無いと保存できない' do
        item = FactoryBot.build(:item, text: nil)
        item.valid?
        expect(item.errors[:text]).to include("を入力してください")
      end

      it 'priceが無いと保存できない' do
        item = FactoryBot.build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it 'priceが全角だと保存できない' do
        item = FactoryBot.build(:item, price: '１２３４')
        item.valid?
        expect(item.errors[:price]).to include("は数値で入力してください")
      end

      it 'priceが数字以外だと保存できない' do
        item = FactoryBot.build(:item, price: 'アイウエオ')
        item.valid?
        expect(item.errors[:price]).to include("は数値で入力してください")
      end

      it 'category_idが無いと保存できない' do
        item = FactoryBot.build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
      end

      it 'condition_idが無いと保存できない' do
        item = FactoryBot.build(:item, condition_id: nil)
        item.valid?
        expect(item.errors[:condition_id]).to include("を入力してください")
      end

      it 'burden_idが無いと保存できない' do
        item = FactoryBot.build(:item, burden_id: nil)
        item.valid?
        expect(item.errors[:burden_id]).to include("を入力してください")
      end

      it 'area_idが無いと保存できない' do
        item = FactoryBot.build(:item, area_id: nil)
        item.valid?
        expect(item.errors[:area_id]).to include("を入力してください")
      end

      it 'shipping_date_idが無いと保存できない' do
        item = FactoryBot.build(:item, shipping_date_id: nil)
        item.valid?
        expect(item.errors[:shipping_date_id]).to include("を入力してください")
      end

      it 'imageが無いと保存できない' do
        item = FactoryBot.build(:item, )
        item.valid?
        expect(item.errors[:images]).to include("を入力してください")
      end
    end
  end
end