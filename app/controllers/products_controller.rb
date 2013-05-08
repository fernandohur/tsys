class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @isProfessor = session[:user_type]=="Professor"
    @products = Product.search(params[:search])
    @search = params[:search]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show

    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new
    @product.name = params[:name]
    @product.student_id = Student.find_by_username(session[:login]).id

    if !@product.valid?
      flash[:error] = "Sorry. Can not have two or more products with the same name"
      respond_to do |format|
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    elsif params[:file].blank?
      flash[:error] = "You MUST upload a file in order to create a product."
      respond_to do |format|
        format.html { redirect_to @product }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end

    else
      uploaded_io = params[:file]
      path = Rails.root.join('public', 'products', uploaded_io.original_filename);
      File.open(path, 'w:ASCII-8BIT') do |file|
        file.write(uploaded_io.read)
      end
      realPath = File.absolute_path(path).split("public/")[1]
      @product.file_url= realPath
      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'The product was successfully created.' }
          format.json { render json: @product, status: :created, location: @product }
        else
          format.html { render action: "new" }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end

    end


  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    path = @product.file_url
    @product.destroy
    if(@product.destroyed? && !@product.file_url.blank?)
      File.delete("public/"+path)
    end

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
