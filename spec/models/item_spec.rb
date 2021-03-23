require 'rails_helper'

RSpec.describe '出品機能', type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context "登録できるとき" do
    it "画像が１枚あること" do
      expect(@item.image).to be_valid
    end
  end

  context "登録できないとき" do
    it "商品名が空だと登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it "商品説明が空だと登録できない" do
      @item.concept = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Concept can't be blank")
    end
    
    it "カテゴリーが空だと登録できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    
    it "商品の状態の情報が空だと登録できない" do
      @item.item_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status can't be blank")
    end
    
    it "配送料についての情報が空だと登録できない" do
      @item.delivery_price_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery price can't be blank")
    end
    
    it "発送元の地域の情報が空だと登録できない" do
      @item.delivery_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank")
    end
    
    it "発送までの日数の情報が空だと登録できない" do
      @item.delivery_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end
    
    it "販売価格が空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    
    it "販売価格が半角数字でなければ登録できない" do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    
    it "販売価格が300円未満だと登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it "販売価格が9,999,999円を超えていると登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")  
    end 
  end
end
