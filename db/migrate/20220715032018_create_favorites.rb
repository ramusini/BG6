# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer "user_id"
      t.integer "bucket_list_id"

      t.timestamps
    end
  end
end
