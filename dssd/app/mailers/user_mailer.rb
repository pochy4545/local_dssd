class UserMailer < ApplicationMailer
    default from: 'dssdgrupo2@gmail.com'

    def enviar
        @user = params[:user]
        mail(to: @user ,subject: 'Welcome to My Awesome Site')
    end
end
