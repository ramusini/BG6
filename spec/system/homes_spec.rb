# frozen_string_literal: true

require 'rails_helper'

describe 'ホーム画面のテスト' do
  context '未ログイン状態の画面の確認' do
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
  context 'ログイン状態' do
    before do
      @user = FactoryBot.create(:user)
      visit root_path
      click_link 'ログイン'
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
    end
    it '左上にサイト名があり、リンク先が正しいか' do
      click_link 'BG録 BoardGameRecorder'
      expect(page).to have_current_path root_path
    end
    it '左上に「相手を探す」があり、リンク先が正しいか' do
      click_link '相手を探す'
      expect(page).to have_current_path searches_path
    end
    it '右上にボードゲーム検索フォームがあり、検索後のリンク先が正しいか' do
      all('.word')[1].set("カタン")
      expect(page).to have_current_path boardgames_path('カタン')
    end
    it '右上にがあり、リンク先が正しいか' do

    end
    it '右上にがあり、リンク先が正しいか' do

    end
  end
  context 'adminログイン状態' do
    before do
      visit root_path
    end
  end
end

