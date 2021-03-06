class RejectedOrdersController < ApplicationController
  def new
    @order_client = OrderClient.find(params[:order_client_id])
    @rejected_order = RejectedOrder.new
  end

  def create
    @order_client = OrderClient.find(params[:order_client_id])
    @rejected_order = @order_client.create_rejected_order(rejected_order_params)

    if @rejected_order.save
      @order_client.rejected!
      redirect_to @order_client, notice: t('flash.order.rejected')
    else
      render :new
    end
  end

  private

  def rejected_order_params
    params.require(:rejected_order).permit(:reason)
  end
end
