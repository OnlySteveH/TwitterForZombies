class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_filter :get_zombie

  def get_zombie
    @zombie = Zombie.find(params[:zombie_id])
  end
  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = @zombie.tweets
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = @zombie.tweets.find(params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = @zombie.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: [@zombie, @tweet] }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:status, :zombie_id)
    end
end
