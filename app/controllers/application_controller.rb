class ApplicationController < ActionController::API
    def tokenGenerator
        
        _privateKey = "juizZeRuela"

        _ts = params[:ts]
        _date = params[:date]

        generate_key = "#{Date.today}#{_privateKey}#{_ts}"

        key = {
            token: "#{Digest::SHA256.hexdigest generate_key}",
            ts: _ts
            date: _date
        }

        return key
    end

    def authenticate!
        _token = params[:token].to_s.downcase!

        if tokenGenerator[:token].to_s == _token.to_s
            #Do something
            @authentication = Authentication.create([
                {token: _token, 
                ts: tokenGenerator[:ts],
                date: tokenGenerator[:date]
                }
            ])

            render json: @authentication
        else
            puts "User isn`t authenticated"
        end
    end

    def is_auth
        if  Authentication.where(:id=>tokenGenerator[:token]).size == 0
            render json:{error: "Access Denied", status: 403}
            raise
        end
    end
end
