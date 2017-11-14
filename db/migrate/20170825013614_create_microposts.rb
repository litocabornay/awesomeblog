class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      # userテーブルのindexを取ってくる。
      # referencesする時は必須のオプション(コピペ)

      t.timestamps null: false
  end
  add_index :microposts, [:user_id, :created_at], unique: true
  #add_index　=　イマジナリーTABLEを作る（同一ユーザーのポストだけに改変したもの）
  #:user_id =　誰が投稿したか
  #:created_at　=　いつ投稿されたか
    
  end
end
