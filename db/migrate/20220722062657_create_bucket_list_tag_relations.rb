class CreateBucketListTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :bucket_list_tag_relations do |t|
      t.references :bucket_list, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
