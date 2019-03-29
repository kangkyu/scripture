class VersesController < ApplicationController
  def index
    book = params[:id].presence || "창"
    if book.in? Verse.books
      @verses = Verse.where(book: book).order(:chapter, :number)
    else
      render html: "<h1>‘#{book}’ 없습니다.</h1>".html_safe, layout: true
    end
  end
end
