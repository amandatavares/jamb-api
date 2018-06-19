class ApplicationController < ActionController::API
    def tokenGenerator
        
        _privateKey = "juizZeRuela"
        _ts = Time.now.to_i
        _date = Date.today

        generate_key = "#{_date}#{_privateKey}#{_ts}"

        key = {
            token: "#{Digest::SHA256.hexdigest generate_key}",
            ts: _ts,
            date: _date
        }

        return key
    end

    def authenticate!
        _current_student = Student.find_by_email_and_password(params[:email],params[:password])
        if _current_student != nil
            token = tokenGenerator[:token]
            @authentication = Authentication.create([
                {
                    token: token, 
                    ts: tokenGenerator[:ts],
                    date: tokenGenerator[:date]
                }
            ])
            render json: {token: token, status: 200}
        else
            render json: {message: "Access Denied", status: 403}
        end
    end

    def is_auth
        if  Authentication.where(:id=>tokenGenerator[:token]).size == 0
            render json:{error: "Access Denied", status: 403}
            raise
        end
    end
end
