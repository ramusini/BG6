# frozen_string_literal: true

require 'rails_helper'

describe 'boardgameコントローラーのテスト' do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    # 検索フォームで検索
    fill_in 'word', with: 'オーディン'
    click_button '検索'
  end
  context 'indexの確認' do
    it '「"タイトル"の検索結果」が表示されているか' do
      expect(page).to have_content '"オーディン"の検索結果'
      expect(page).to have_content '：1件'
    end
    it '「詳細確認」ボタンがあり、ただしく機能しているか' do
      click_button '詳細確認'
      expect(page.current_path).to eq search_path(id: 177736)
    end
  end
  context 'showの確認' do
    it '「遊んだ」のボタンがあり、リンクが正しく機能しているか' do
      click_button '詳細確認'
      click_button '遊んだ'
      expect(page).to have_current_path new_record_path(bg_id: 177736)
    end
    it '「遊びたい」のボタンがあり、リンクが正しく機能しているか' do
      click_button '詳細確認'
      click_button '遊びたい'
      expect(page.current_path).to eq new_bucket_list_path
    end
  end
  context 'createの確認' do
    click_link 'まだこのテストは実装できていない'
  end
end
