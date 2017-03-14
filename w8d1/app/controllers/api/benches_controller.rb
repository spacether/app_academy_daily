class Api::BenchesController < ApplicationController
  def index
    @benches = Bench.all
    render :index
  end

  def show
    @bench = Bench.find_by_id(params[:id])
    if @bench
      render :show
    else
      render json: ['Bench not found'], status: 404
    end
  end

  def create
    @bench = Bench.new(user_params)
    if @bench.save
      render :show
    else
      render json: @bench.errors.full_messages, status: 400
    end
  end

  private

  def user_params
    params.require(:bench).permit(:description, :lat, :lng)
  end


end
