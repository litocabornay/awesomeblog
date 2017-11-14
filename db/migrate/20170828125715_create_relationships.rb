class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    
    
    #大前提１：各ユーザーが各イマジナリーテーブルを２つ持っている。
    add_index :relationships, :follower_id
    #フォローしてる人一覧
    add_index :relationships, :followed_id
    #フォローされてる人一覧
    
    #大前提２：全体の管理として全てのフォロー/フォロワーペアを管理してるイマジナリーテーブルがある。
    add_index :relationships, [:follower_id, :followed_id], unique: true
    # follower_idとfollowed_idのペアに一意性を持たせてる　→被りNG
    
    # index - イマジナリーテーブル
    # index は名前がない
    
    # efficiencyにするために作る。
    # これは、テーブルから呼び出すより必要な情報だけとったほうが早いということ。
    
  end
end
