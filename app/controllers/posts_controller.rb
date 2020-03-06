class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def update_inline
    @post = Post.where(uuid: params[:id]).first
    @post.update(content: params[:content])
    head :ok
  end

  def upload
    @attachment = Attachment.new(file: params[:upload])
    if @attachment.save
      render json: {
        url: @attachment.file.url
      }
    else
      render json: {
        "error": {
          "message": "The image upload failed. Error: #{@attachment.errors.full_messages.join(', ')}"
        }
      }
    end
  end

  def public_page
    @post = Post.where(uuid: params[:id]).first
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def inline
    @post = Post.with_template('inline')
    redirect_to @post
  end

  def classic
    @post = Post.with_template('classic')
    redirect_to [:edit, @post]
  end

  def classic_simple_form
    @post = Post.with_template('classic_simple_form')
    redirect_to [:edit, @post]
  end

  def balloon
    @post = Post.with_template('balloon')
    redirect_to @post
  end

  # GET /posts/new
  def new
    @post = Post.with_template("classic")
    if @post.template =~ /classic/
      redirect_to [:edit, @post]
    else
      redirect_to @post
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def demo_api
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      # just to hide ID's
      # and use uuid
      # for testing on heroku to avoid mass creation
      @post = Post.where(id: params[:id]).first || Post.where(uuid: params[:id]).first
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :uuid)
    end
end
