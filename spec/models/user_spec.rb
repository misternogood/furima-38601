require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do

    end
    context '新規登録できない時'
    it 'nicknameが空では登録できない' do

    end
    it 'emailが空では登録できない' do
    
    end
    it '重複したemailが存在する場合は登録できない' do

    end
    it 'emailは@を含まないと登録できない' do

    end
    it 'passwordが空では登録できない' do

    end
    it 'passwordが5文字以下では登録できない' do

    end
    it 'passwordが半角英字のみでは登録できない' do
      
    end
    it 'passwordが半角数字のみでは登録できない' do
      
    end
    it 'passwordに全角文字を含むと登録できない' do
      
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do

    end
    it 'last_nameが空では登録できない' do
      
    end
    it 'last_nameに半角文字を含むと登録できない' do
      
    end
    it 'first_nameが空では登録できない' do
      
    end
    it 'first_nameに半角文字を含むと登録できない' do
      
    end
    it 'last_name_kanaが空では登録できない' do
      
    end
    it 'last_name_kanaがカタカナ以外では登録できない' do
      
    end
    it 'first_name_kanaが空では登録できない' do
      
    end
    it 'first_name_kanaがカタカナ以外では登録できない' do
      
    end
    it 'birth_dateが空では登録できない' do
      
    end
  end

end
