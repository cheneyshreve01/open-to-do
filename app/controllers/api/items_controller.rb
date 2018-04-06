class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    list = List.where(id: params[:list_id]).first
    item = list.items.build(item_params)

    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:description, :list_id)
  end

end
