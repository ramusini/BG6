# frozen_string_literal: true

require 'rails_helper'

describe '新規タグ作成画面(new_admin_tag_path)のテスト' do
  let!(:tag) { create(:tag, name:'hoge') }
  before do
    visit new_admin_tag_path
  end
  context '表示の確認' do
    it 'new_admin_tag_pathが"/admin/tags/new"であるか' do
      expect(current_path).to eq('/admin/tags/new')
    end
    it '作成ボタンがあるか' do
      expect(page).to have_button '作成'
    end
    it 'タグ一覧があるか' do
      expect(page).to have_content tag.name
    end
    it 'タグ削除リンクがあるか' do
      expect(page).to have_link '削除'
    end
  end
  context '作成処理のテスト' do
    it '作成後のリダイレクト先は正しいか' do
      edit_link = find_all('a')[3]
      edit_link.click
      expect(current_path).to eq('/admin/tags/new')
    end
  end
  context 'タグ削除のテスト' do
    it 'タグ削除' do
      expect{ tag.destroy }.to change{ Tag.count }.by(-1)
    end
  end
end
