=begin
ルーティングを設定するファイル
ユーザーが特定のURLにアクセスした時に、どのコントローラのどのアクションに処理を振り分けるかを定義するファイル
→ URLとコントローラ（アクション）を紐付ける

◆ルーティングの記述方法   →     HTTPメソッド 'URL' => 'コントローラ#アクション'
HTTPメソッド：ユーザーが行いたい処理をサーバーに伝える役割
HTTPメソッドの種類
・GET：ブラウザからサーバーへURLを送信し、Webページを取得する
・POST：ブラウザからサーバーへ、URL以外のデータも送信して処理を命令する
・DELETE：ブラウザからサーバーへ、URL以外のデータ削除のための情報も送信して処理を命令する
=end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  get 'todolists/new'
  post 'todolists' => 'todolists#create'
  get 'todolists' => 'todolists#index'
  get 'todolists/:id' => 'todolists#show', as: 'todolist'
  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
end
