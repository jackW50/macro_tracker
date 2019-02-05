class FoodsController < ApplicationController

  def show
    @food = Food.find(params[:id])
    #raise params.inspect
  end
end
