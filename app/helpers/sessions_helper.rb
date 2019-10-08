module SessionsHelper

    def log_in(user)
        # ここの（user）引数は、
        session[:user_id] = user.id

    # sessionの内容を保存するためのコード
    end

    def log_out
        session.delete(:user_id)
        # ログアウトするときに、user_idを消すことで、sessionメソッドが無効になる
    end

    def current_user
        User.find_by(id: session[:user_id])
        # ログインしているユーザーのidを取得する
    end
    
    def logged_in?
        !current_user.nil?
        #ログイン中のユーザーがいるときfalseの逆だよという文(true = if current_user is nill false = if current_user in not nil.
    end
    
end