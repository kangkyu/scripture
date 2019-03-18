class FilesController < ApplicationController

  def create
    file = params['file']
    regex = %r{^(?<book>\p{Word})(?<chapter>\d+):(?<number>\d+) (?<text>[\p{Word}.,!?“”‘’<>\- ]+)}
    File.foreach(file.path) do |line|
      if data = line.match(regex)
        named = data.named_captures
        book = named['book'].squish
        chapter = named['chapter'].to_i
        number = named['number'].to_i
        text = named['text']
        if verse = Verse.find_by(book: book, chapter: chapter, number: number)
          # verse.update(text: text)
        else
          verse = Verse.new(book: book, chapter: chapter, number: number, text: text, edition: "쉬운성경")
          verse.save
        end
      end
    end
    head :no_content
  end
end
