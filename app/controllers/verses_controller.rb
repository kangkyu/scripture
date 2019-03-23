class VersesController < ApplicationController
  def index
    @verses = Verse.where(book: "창").order(:chapter, :number)
  end
end
