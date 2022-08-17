# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
    # 退会しているかを判断するメソッド
    def user_state
      ## 【処理内容1】 入力されたemailからアカウントを1件取得
      @user = User.find_by(email: params[:user][:email])
      ## アカウントを取得できなかった場合、このメソッドを終了する
      return if !@user
      ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
        ## 【処理内容3】
        flash[:notice] = "アカウントが凍結されています。新規登録してください。"
        redirect_to new_user_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
end
