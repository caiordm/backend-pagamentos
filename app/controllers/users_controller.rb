class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def create
        @user = User.new(user_params)

        if @user.save 
            @wallet = Wallet.new(user: @user)
						@wallet.save
            render json: {
                message: 'Created sucessfully!',
                data: @user,
								wallet: @wallet
            }, status: :created
        else
            render json: {
                message: "#{@user.errors.full_messages.to_sentence}"
            }, status: :unprocessable_entity
        end
    end


    private

    def user_params
        params.require(:user).permit(:nome_completo, :cpfcnpj, :email, :senha, :type_user)
    end
end
