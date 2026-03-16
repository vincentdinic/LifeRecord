class AccountsController < ApplicationController
  # GET /accounts
  def index
    @accounts = @current_family.accounts
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # POST /accounts
  def create
    @account = @current_family.accounts.build(account_params)

    if @account.save
      @accounts = @current_family.accounts
      redirect_to family_accounts_path(@current_family), notice: "Account was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to @account, notice: "Account was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy!
    redirect_to accounts_path, notice: "Account was successfully destroyed.", status: :see_other
  end

  private
    # Only allow a list of trusted parameters through.
    def account_params
      params.expect(account: [ :name, :due_date ])
    end
end
