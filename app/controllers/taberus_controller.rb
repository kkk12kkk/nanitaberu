class TaberusController < ApplicationController
  def new
    @taberu = Taberus.new  
  end

  def edit
    @taberu = Taberu.find(params[:id])
    if @taberu.user == current_user
      render "edit"
    else
      redirect_to taberus_path
    end
  end




  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @newtaberu = Taberu.new(taberu_params)
    @newtaberu.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @newtaberu.save
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "You have creatad taberu successfully"
      redirect_to taberu_path(@newtaberu.id)
    else
      @user = current_user
      @taberus = Taberu.all
      render 'index'
    end
  end

  def index
    @users = User.all
    if current_user
      @user = current_user
    end
      @taberus = Taberu.all
      @newtaberu = Taberu.new
  end

  def show
    @newtaberu = Taberu.new
    #詳細ページを表示する時
    @taberu = Taberu.find(params[:id])
    @user = @taberu.user
  end

  def update
    @taberu = Taberu.find(params[:id])
    @taberu.assign_attributes(taberu_params)
    
    
     if @taberu.save
       flash[:notice] = "Taberu was successfully updated"
       redirect_to taberu_path(@taberu.id)
     else
       flash.now[:alert] = @taberu.errors.full_messages.join
       render :edit
      end 
  end

  def destroy
    @taberu = Taberu.find(params[:id])
    if @taberu.destroy
       flash[:notice]="Taberu was successfully destroyed"
       redirect_to taberus_path
    end
  end

  private
  def taberu_params
    params.require(:taberu).permit(:title, :body)
 end

 def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
 end
end