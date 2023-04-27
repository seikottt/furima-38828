require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
    end
  end
end