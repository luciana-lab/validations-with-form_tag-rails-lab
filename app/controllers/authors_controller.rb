class AuthorsController < ApplicationController
  def show
    author_find_by_id
  end

  def new
    @author = Author.new
  end

  def edit
    author_find_by_id
  end

  def update
    author_find_by_id
    
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  def create
    @author = Author.new(author_params)
    
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def author_find_by_id
    @author = Author.find_by_id(params[:id])
  end
end
