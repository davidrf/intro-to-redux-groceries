class GroceriesController < ApplicationController
  def index
    groceries = Grocery.all.order(created_at: :desc)
    render json: { groceries: groceries }
  end

  def create
    grocery = Grocery.new(grocery_params)

    if grocery.save
      render json: { grocery: grocery }, status: :created
    else
      render json: { errors: grocery.errors.full_messages }
    end
  end

  private

  def grocery_params
    params.require(:grocery).permit(:name)
  end
end
