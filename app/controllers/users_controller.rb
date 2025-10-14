class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  def new
    @user = @User.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @user = User.new(user_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @user.save
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "ユーザー登録に成功しました。"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "ユーザー登録に失敗しました。"
      render :new
    end
  end

  def index
    if current_user
      @user = current_user
    end
      @users = User.all
      @taberus = Taberu.all
      @newtaberu = Taberu.new
  end




  def show
    @user = User.find(params[:id])
    @taberu = Taberu.new
    @taberus = Taberu.where(user_id: @user.id)
    @newtaberu = Taberu.new
  end
  
  def edit
  end

  def destroy
    @user = User.find(params[:id]) #追加
    @user.destroy  # データ（レコード）を削除
    flash[:notice] = "ユーザーを削除しました。" #追加
    redirect_to '/users'  # 投稿一覧画面へリダイレクト
  end

  def update
    if  @user.update(user_params)
      flash[:notice] = "You have update user successfully"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_url
    end
  end
end