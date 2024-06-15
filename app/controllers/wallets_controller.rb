class WalletsController < ApplicationController
    def index 
        @wallets = Wallet.all
        render json: @wallets
    end

    def deposit
        
    end

    def withdraw

    end
end
