class AuthenticationsController < ApplicationController
    #before_action :authenticate!
    # skip_before_action :is_auth, only: [:signin]
    
    def getStudent
        current_student = Student.find_by_email_and_password(params[:email],params[:password])
        return current_student
    end

    def signin
        #Code copied from application authenticate
        _current_student = getStudent
        if _current_student != nil
            token = tokenGenerator[:token]
            @authentication = Authentication.create([
                {
                    token: token, 
                    ts: tokenGenerator[:ts],
                    date: tokenGenerator[:date]
                }
            ])
            render json: {token: token, student: _current_student, status: 200}
        else
            render json: {message: "Access Denied", status: 403}
        end
    end

    def logout
        if Authentication.find_by_token(session[:token].to_s)
            Authentication.find_by_token(session[:token].to_s).destroy
            render json: {message:"User logged out", status:200}
        end
    end

    #<input type=email name="authenticate[email]">
    #<input type=password name="authentica[password]">
end
