class AuthorsController < ApplicationController
  before_action :current_author, only: [:show, :edit, :update, :destroy]
  def index
    @authors = Author.all
  end

  def show

  end

  def new
    @author = Author.new
  end

  def create
    author = Author.new(author_params)
    author.save
    redirect_to author
  end

  def edit

  end

  def update
    @author.update(author_params)
    redirect_to @author
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  def author_params
    params.require(:author).permit(:name, :book)
  end

private

def current_author
  @author ||= Author.find_by(id: params[:id])
end

end
