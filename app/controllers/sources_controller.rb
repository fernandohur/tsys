class SourcesController < ApplicationController

  def index
    @sources = Source.all
  end

  def show
    @source = Source.find(params[:id])
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(params[:source])
    puts params
    puts " asdasd==============================================="
    uploaded_io = params[:dataFile]

    path = Rails.root.join('public', 'uploads', uploaded_io.original_filename);
    File.open(path, 'w:ASCII-8BIT') do |file|
      file.write(uploaded_io.read)
    end
    @source.path=path
    @source.save
    flash[:notice]="la fuente fue exitosamente creada"
    redirect_to @source
  end

  def destroy
    source = Source.find(params[:id])
    source.destroy

    if (source.destroyed?)
      flash[:notice]="Fuente exitosamente eliminada";
    else
      flash[:error]="No se pudo eliminar la fuente"
    end
    redirect_to "/sources"
  end

end
