class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => params[:per_page])

    render json: @posts, each_serializer: PostSerializer, meta: resources_meta
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    render json: @post
  end

  protected
  def resources_meta
    {
      totalPages: @posts.total_pages,
      currentPage: @posts.current_page,
      perPage: @posts.per_page
      
    }
  end
end
