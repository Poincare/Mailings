class UploadController < ApplicationController
  def upload
    @mail = Mail.new
  end

  def upload_create
    @mail = Mail.create(params[:mail])
  end
end
