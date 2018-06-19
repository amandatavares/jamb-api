class AuthenticationsController < ApplicationController
    before_action :authenticate!

    def sign_in
    end
    def logout
        if Authentication.find_by_token(session[:token].to_s)
            Authentication.find_by_token(session[:token].to_s).destroy
            render json: {message:"User logged out", status:200}
    end

end
