class AccountTransactionsController < ApplicationController

  before_action :account_transaction_params, only: [:create]

  def create
    @account = Account.find_by_id(params[:account_transaction][:account_id])
    @account_transaction = AccountTransaction.create_by_params(@account, current_user, @account_transaction_params)

    respond_to do |format|
      if @account_transaction.errors.blank?
        format.html { redirect_to @account, notice: 'Account transaction was successfully created.' }
        # format.json { render :show, status: :created, location: @account_transaction }
      else
        format.html { redirect_to @account }
        format.json { render json: @account_transaction.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  def account_transaction_params
    @account_transaction_params = params.require(:account_transaction).permit(:value, :purpose, :category_id)
  end

end
