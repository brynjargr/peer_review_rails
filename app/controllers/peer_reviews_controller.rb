class PeerReviewsController < ApplicationController
  before_action :set_peer_review, only: [:show, :edit, :update, :destroy]

  # GET /peer_reviews
  # GET /peer_reviews.json
  def index
    @peer_reviews = PeerReview.all.order(:name)
  end

  # GET /peer_reviews/1
  # GET /peer_reviews/1.json
  def show
    @parser = PeerReviewParser.new(@peer_review.peer_reviews, @peer_review.self_review)
    @averages = @parser.averages_hash
    @counts = @parser.counts
    @self_review_counts = @parser.self_review_counts
    @text_feedback = @parser.text_feedback
  end

  # GET /peer_reviews/new
  def new
    @peer_review = PeerReview.new
  end

  # GET /peer_reviews/1/edit
  def edit
  end

  # POST /peer_reviews
  # POST /peer_reviews.json
  def create
    @peer_review = PeerReview.new(peer_review_params)

    respond_to do |format|
      if @peer_review.save
        format.html { redirect_to @peer_review, notice: 'Peer review was successfully created.' }
        format.json { render :show, status: :created, location: @peer_review }
      else
        format.html { render :new }
        format.json { render json: @peer_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peer_reviews/1
  # PATCH/PUT /peer_reviews/1.json
  def update
    respond_to do |format|
      if @peer_review.update(peer_review_params)
        format.html { redirect_to @peer_review, notice: 'Peer review was successfully updated.' }
        format.json { render :show, status: :ok, location: @peer_review }
      else
        format.html { render :edit }
        format.json { render json: @peer_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peer_reviews/1
  # DELETE /peer_reviews/1.json
  def destroy
    @peer_review.destroy
    respond_to do |format|
      format.html { redirect_to peer_reviews_url, notice: 'Peer review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peer_review
      @peer_review = PeerReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peer_review_params
      params[:peer_review].permit(:peer_reviews,:self_review,:name)
    end
end
