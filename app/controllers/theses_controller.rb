class ThesesController < ApplicationController


  def home

  end

  # GET /theses
  # GET /theses.json
  def index
    @theses = Thesis.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @theses }
    end
  end

  # GET /theses/1
  # GET /theses/1.json
  def show
    @thesis = Thesis.find(params[:id])
    @activities = @thesis.activities.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thesis }
    end
  end

  # GET /theses/new
  # GET /theses/new.json
  def new
    @thesis = Thesis.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thesis }
    end
  end

  # GET /theses/1/edit
  def edit
    @thesis = Thesis.find(params[:id])
  end

  # POST /theses
  # POST /theses.json
  def create
    @thesis = Thesis.new(params[:thesis])
    respond_to do |format|
      if @thesis.save
        @thesis.activities.create(name: "Revision bibliografica inicial")
        @thesis.activities.last.create_product(name: "Documento tecnico con revision del estado del arte")

        @thesis.activities.create(name: "Planteamiento del Problema")
        @thesis.activities.last.create_product(name: "Problema, hipotesis, preguntas, relevancia y pertinencia del problema")

        @thesis.activities.create(name: "Objetivos de la Tesis")
        @thesis.activities.last.create_product(name: "Objetivo general y objetivos especificos")

        @thesis.activities.create(name: "Estrategia de Solucion")
        @thesis.activities.last.create_product(name: "Estrategia propuesta para la solucion del problema")

        @thesis.activities.create(name: "Implementacion")
        @thesis.activities.last.create_product(name: "Documentos y software para implementar la solucion")

        @thesis.activities.create(name: "Validacion")
        @thesis.activities.last.create_product(name: "Disenio de experimentos, resultados y analisis de estos")

        @thesis.activities.create(name: "Documentacion y Reporte de Tesis")
        @thesis.activities.last.create_product(name: "Documento de Tesis")



        format.html { redirect_to @thesis, notice: 'Thesis was successfully created.' }
        format.json { render json: @thesis, status: :created, location: @thesis }
      else
        format.html { render action: "new" }
        format.json { render json: @thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /theses/1
  # PUT /theses/1.json
  def update
    @thesis = Thesis.find(params[:id])

    respond_to do |format|
      if @thesis.update_attributes(params[:thesis])
        format.html { redirect_to @thesis, notice: 'Thesis was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theses/1
  # DELETE /theses/1.json
  def destroy
    @thesis = Thesis.find(params[:id])
    @thesis.destroy

    respond_to do |format|
      format.html { redirect_to theses_url }
      format.json { head :no_content }
    end
  end

  # @return [Object]
  def authenticate
    password = params[:password]
    username = params[:username]

    #Using LDAP
    require 'rubygems'
    require 'net/ldap'
    ldap = Net::LDAP.new
    ldap.host = "x500.bund.de"
    ldap.port = "389"
    ldap.auth username, password
    is_authorized = ldap.bind

    puts "---------------------------------"
    puts is_authorized
    puts "---------------------------------"

    attrs = []
    ldap.search( :base => "l=init,ou=Service,o=Bund,c=DE", :attributes => attrs, :return_result => true ) do |entry|
    # entry is records returned after search
    end

    is_authorized = true
    if is_authorized==true
      @accessed=Student.find_by_username(username)
      redirect_to @accessed
    else
      flash[:notice]="Invalid user"
      redirect_to "/login"
    end



  end

end
