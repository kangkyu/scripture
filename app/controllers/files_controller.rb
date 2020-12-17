class FilesController < ApplicationController

  def create
    AddVerses.new(params['file']).run
    head :no_content
  end
end
