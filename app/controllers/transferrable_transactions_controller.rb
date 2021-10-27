class TransferrableTransactionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def index   
        user_transactions = @current_user.transferrable_transactions
        render json: user_transactions, status: :ok
    end

    def create 
        user_transaction = @current_user.transferrable_transactions.create!(transaction_params)
        render json: user_expense, status: :created
    end

    def update
        confirmed_transaction = Transferrable_Transaction.find_by(id: params[:id])
        confirmed_transaction.update!(confirmed: params[:confirmed])
        render json: confirmed_transaction, status: :ok
    end
    
    private

    def transaction_params
        params.permit(:transactor_id, :transactee_id, :cost, :category, :message, :transaction_to_user)
    end
    

    def render_not_found_response
        render json: {error: "Transaction not found"}, status: :not_found  
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
