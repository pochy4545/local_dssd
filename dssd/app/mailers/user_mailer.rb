class UserMailer < ApplicationMailer
    default from: 'dssdgrupo2@gmail.com'

    def enviar
        @videoconferencium = params[:videoconferencium]
        @user = params[:user]
        mail(to: @user ,subject: 'Registro de videoconferencia')
    end
end
