class ApprovedOrdersController < ApplicationController
  def create
    @approved_order = ApprovedOrder.create(params.permit(:order_client))
    @approved_order.save
    @order_client = OrderClient.find(params[:order_client_id])
    @order_client.accepted!

    redirect_to @order_client
  end
end