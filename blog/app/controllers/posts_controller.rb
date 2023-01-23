require 'jwt'
require 'json/jwt'
require 'json'
class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index

    "test   from main"
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    jwks_uri = 'https://saltire.lti.app/platform/jwks'
    kid = '6ox0b5ag4w'
    puts JSON::JWK::Set
    puts JSON::JWK::Set
    # ::Fetcher.cache = Rails.cache
    # jwk_set = JSON::JWK::Set::Fetcher.fetch(jwks_uri, kid: kid)
    puts "333333333333333333333333333333333333333"
    puts jwk_set
    puts "ddddddddddddddddxxxxxxxxxxxxxxxxxxxx"
    respond_to do |format|
      if @post.save
        puts "ddddddddddddddddddddddd"
        users =  ["ameersohailms@gmail.com", "ameer09981@gmail.com", "sumathichitra9597@gmail.com", "varijapatpal056@gmail.com", "varijapatpaljr@gmail.com"]


        # PostMailer.welcome_email(@post, "ameersohailms@gmail.com").deliver_now
        puts "fffffffffffffffffffffffffffffffffffggggggggggggggggg"

        # GuestsCleanupJob.perform_later(@post, users)
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
