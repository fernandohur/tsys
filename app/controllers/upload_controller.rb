class UploadController < ApplicationController
  def index
  end

  def uploadFile
    uploaded_io = params[:dataFile];
    path = Rails.root.join('public', 'uploads', uploaded_io.original_filename);
    File.open(path, 'w:ASCII-8BIT') do |file|
      file.write(uploaded_io.read)
    end
    flash[:notice]="file upload successfull"
    redirect_to "/upload/index"
  end
end
