=begin
todolistsに関するファイル
クライアントから何かしらリクエストがあった場合、アクションする方法を定義するファイル
コントローラのインスタンス変数をViewと共有することで、コントローラからViewへのデータの受け渡しが行われる
インスタンス変数の名前には、先頭に必ず@をつけること
=end



class TodolistsController < ApplicationController
  
  def new
    @list = List.new
    # List.newは空のモデル
    # インスタンス変数が代入されてViewで利用できるようになる
    # 様々なhtml.erbファイルで入力されたインスタンス変数が@listに格納され、このファイルにデータが送られてくる？
    # → @listに格納されたデータがList.newという空のモデルに格納され下記で定義したアクションを実行することとなる？
  end


  def create
    # list_params：フォームで入力されたデータを受け取っている
    # paramsとは？
    # クライアントから送信された値を1つにまとめてparams[:パラメータ名]という形式でアクセスできるようにしている
    # クライアントが送った値をどう受け取るかを定義できるもの？
    list = List.new(list_params)
    list.save
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end