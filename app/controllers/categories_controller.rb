class CategoriesController < ApplicationController

	before_action :set_category, only: [:show]

	def new
		@category = Category.new
	end

	def show

	end

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "Category created Successfully"
			redirect_to @category
		else
			render 'new'
		end
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

	def set_category 
		@category =  Category.find(params[:id])
	end

end