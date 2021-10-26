class UserExpensesController < ApplicationController
    def index   
        render json: UserExpense.all
    end
end
