class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  def index
    @category = Category.new
    @categories = current_user.categories
  end
  def show
    @tasks = @category.tasks.where(user_id: current_user.id).order(created_at: :desc)
  end
  def create
    if Category.find_by(name: category_params[:name]).present?
      @categoryuser = CategoryUser.new(category_id: Category.find_by(name: category_params[:name]).id, user_id: current_user.id)
      if @categoryuser.save
        redirect_to categories_path, success: 'Категория сохранена'
      else
        redirect_to categories_path, danger: 'Категория уже создана'
      end
    else
      @category = Category.new(category_params)
      if @category.save
        CategoryUser.create(category_id: Category.find_by(name: @category.name).id, user_id: current_user.id)
        redirect_to categories_path, success: 'Категория сохранена'
      else
        redirect_to categories_path, danger: 'Категория не сохранена'
      end
    end
  end
  def edit
  end
  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path, success: 'Категория обновлена'
    else
      redirect_to categories_path, danger: 'Категория не обновлена'
    end
  end
  def destroy
    CategoryUser.find_by(category_id: @category.id, user_id: current_user.id ).delete
    redirect_to categories_path, danger: 'Статья удалена'
  end
  private

  def category_params
    params.require(:category).permit(:name)
  end
  def find_category
    @category = Category.find(params[:id])
  end
end
