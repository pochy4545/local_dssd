class UserMailer < ApplicationMailer
    default from: 'dssdgrupo2@gmail.com'

    def enviar
        @videoconferencium = params[:videoconferencium]
        @user = params[:user]
        mail(to: @user ,subject: 'Registro de videoconferencia')
    end

    def cancelar
        @videoconferencium = params[:videoconferencium]
        @user = params[:user]
        mail(to: @user ,subject: 'Cancelacion de videoconferencia')
    end

    def finalizar
        @videoconferencium = params[:videoconferencium]
        @user = params[:user]
        @estado = params[:estado]
        mail(to: @user ,subject: 'Finalizo la videoconferencia')
    end
end
