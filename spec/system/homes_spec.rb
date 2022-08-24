# frozen_string_literal: true

require 'rails_helper'

describe 'ヘッダーのテスト' do
  context '未ログイン状態での表示の確認' do
    before do
      visit root_path
    end
    it '左上にサイト名があり、リンク先が正しいか' do
      click_link 'BG録 BoardGameRecorder'
      expect(page).to have_current_path root_path
    end
    it '右上に「ゲストログイン」があり、リンク先が正しいか' do
      click_link 'ゲストログイン'
      expect(page).to have_current_path root_path
    end
    it '右上に「会員登録」があり、リンク先が正しいか' do
      click_link '会員登録(なんとタダ)!'
      expect(page).to have_current_path new_user_registration_path
    end
    it '右上に「ログイン」があり、リンク先が正しいか' do
      click_link 'ログイン'
      expect(page).to have_current_path new_user_session_path
    end
  end
  context 'ログイン状態での表示の確認' do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
    end
    it 'ログイン後、ボードゲーム検索画面にいるか' do
      expect(page).to have_button '検索'
    end
    it '左上にサイト名があり、リンク先が正しいか' do
      click_link 'BG録 BoardGameRecorder'
      expect(page).to have_current_path root_path
    end
    it '左上に「相手を探す」があり、リンク先が正しいか' do
      click_link '相手を探す'
      expect(page).to have_current_path searches_path
    end
    it '右上に「ボードゲーム検索フォーム」があり、検索後のリンク先が正しいか' do
      all('#word')[1].set("カタン")
      click_button '検索'
      expect(page.current_path).to eq search_searches_path
      expect(URI.decode_www_form(URI(page.current_url).query).to_h).to eq({"word"=>"カタン", "commit"=>"検索"})
    end
    it '右上に「ユーザー名」があり、リンク先が正しいか' do
      click_link @user.name
      expect(page).to have_current_path user_path(@user.id)
    end
    it '右上に「ログアウト」があり、リンク先が正しいか' do
      click_link 'ログアウト'
      expect(page).to have_current_path root_path
    end
  end
  context 'adminログイン状態での表示の確認' do
    before do
      @admin = FactoryBot.create(:admin)
      visit new_admin_session_path
      fill_in 'admin_email', with: @admin.email
      fill_in 'admin_password', with: @admin.password
      click_button 'Log in'
    end
    it '左上にサイト名があり、リンク先が正しいか' do
      click_link 'BG録 BoardGameRecorder'
      expect(page).to have_current_path admin_searches_path
    end
    it '右上に「タグ管理」があり、リンク先が正しいか' do
      click_link 'タグ管理'
      expect(page).to have_current_path new_admin_tag_path
    end
    it '右上に「ログアウト」があり、リンク先が正しいか' do
      click_link 'ログアウト'
      expect(page).to have_current_path new_admin_session_path
    end
  end
end
