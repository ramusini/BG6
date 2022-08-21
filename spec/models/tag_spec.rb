# frozen_string_literal: true

require 'rails_helper'

describe 'Tagモデルのテスト' do
  it 'タグ名が保存されるか' do
    expect(FactoryBot.build(:tag)).to be_valid
  end
  
  describe 'アソシエーションのテスト' do
    context 'bucket_list_tag_relationsモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:bucket_list_tag_relations).macro).to eq :has_many
      end
    end
  end
end