class EstimatesController < ApplicationController
  # GET /estimates
  # GET /estimates.json
  def index
    @estimates = Estimate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estimates }
    end
  end

  # GET /estimates/1
  # GET /estimates/1.json
  def show
    @estimate = Estimate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @estimate }
    end
  end

  # GET /estimates/new
  # GET /estimates/new.json
  def new
    @estimate = Estimate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estimate }
    end
  end

  # GET /estimates/1/edit
  def edit
    @estimate = Estimate.find(params[:id])
  end

  # POST /estimates
  # POST /estimates.json
  def create
    @estimate = Estimate.new(params[:estimate])

    respond_to do |format|
      if @estimate.save
        format.html { redirect_to @estimate, notice: 'Estimate was successfully created.' }
        format.json { render json: @estimate, status: :created, location: @estimate }
      else
        format.html { render action: "new" }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /estimates/1
  # PUT /estimates/1.json
  def update
    @estimate = Estimate.find(params[:id])

    respond_to do |format|
      if @estimate.update_attributes(params[:estimate])
        format.html { redirect_to @estimate, notice: 'Estimate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimates/1
  # DELETE /estimates/1.json
  def destroy
    @estimate = Estimate.find(params[:id])
    @estimate.destroy

    respond_to do |format|
      format.html { redirect_to estimates_url }
      format.json { head :no_content }
    end
  end
end
