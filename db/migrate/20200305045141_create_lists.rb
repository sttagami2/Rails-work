# マイグレーションでデータベースへ反映する
# マイグレーション：ソフトウェアやシステム、データなどを別の環境に移転したり、新しい環境に切り替えたりすることを意味する
# → クライアントからのリクエストに応じてデータを移転、保存、修正、切り替えたりするためのファイル？
# テーブルの作成や変更を管理するファイル

# データベースのテーブルにカラム（列）を定義するファイル

# create_table :テーブル名 do |t|
# t.データ型 :カラム名

class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|      #listsというテーブルを作成するコード
      t.string :title               #string型のtitleというカラムを定義
      t.string :body                #string型のbodyというカラムを定義
      t.timestamps
    end
  end
end
