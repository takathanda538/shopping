class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customers_path
    else
      flash[:notice] = "入力内容を確認してください"
      render "edit"
    end
  end
  
  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :postal_code, :prefectur, :address, :phone_number, :is_deleted)
    end
  
end
