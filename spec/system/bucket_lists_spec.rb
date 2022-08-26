# frozen_string_literal: true

require 'rails_helper'

describe 'bucket_listコントローラーのテスト' do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
  end
  context 'new,createの確認' do
    it '投稿が正しくできるか' do
      fill_in 'word', with: 'オーディン'
      click_button '検索'
      click_button '詳細確認'
      click_button '遊びたい'
      
    end    
  end
  context 'indexの確認' do
  end
  context 'showの確認' do
  end
  context 'edit,destroyの確認' do
  end
end