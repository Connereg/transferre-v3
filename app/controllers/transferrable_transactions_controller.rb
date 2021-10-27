class TransferrableTransactionsController < ApplicationController
    def index  
        render json: TransferrableTransaction.all
    end
end
