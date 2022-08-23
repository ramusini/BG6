# frozen_string_literal: true

require 'rails_helper'

describe '新規タグ作成画面(new_admin_tag_path)のテスト' do
  # let!(:tag) { create(:tag, name:'hoge') }
  before do
    @tag = FactoryBot.create(:tag)
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
      expect(page).to have_content @tag.name
    end
    it 'タグ削除リンクがあるか' do
      expect(page).to have_link '削除'
    end
  end
  context '処理の確認' do
    it 'タグ作成後のリダイレクト先は正しいか' do
      fill_in 'name', with: Faker::Lorem.characters(number:5)
      click_button '作成'
      expect(page).to have_current_path new_admin_tag_path
    end
    it 'タグ削除が正しくできるか' do
      expect{ @tag.destroy }.to change{ Tag.count }.by(-1)
    end
  end
end
