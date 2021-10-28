class TransferrableTransactionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def index   
        user_transactions = @current_user.transferrable_transactions
        render json: user_transactions, status: :ok
    end

    def create 
        byebug
        user_transaction = @current_user.transferrable_transactions.create!(
            
            transactee_id: User.find_by(username: params[:tranactee]).id, 
            cost: params[:cost],
            category: params[:category],
            transaction_to_user: params[:transaction_to_user]
        )
        render json: user_expense, status: :created
    end

    def update
        confirmed_transaction = Transferrable_Transaction.find_by(id: params[:id])
        confirmed_transaction.update!(confirmed: params[:confirmed])
        render json: confirmed_transaction, status: :ok
    end
    
    private

    def render_not_found_response
        render json: {error: "Transaction not found"}, status: :not_found  
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
