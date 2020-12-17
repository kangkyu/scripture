class AddVerses
  REGEX = %r{^(?<book>\p{Word})(?<chapter>\d+):(?<number>\d+) (?<text>[\p{Word}.,!?“”‘’<>\- ]+)}

  def initialize(file)
    @file = file
  end

  def run
    File.foreach(file.path) do |line|
      if data = line.match(REGEX)
        add(data.named_captures) 
      end
    end
  end

  private

  def add(named)
    book, chapter, number, text = named['book'].squish, named['chapter'].to_i, named['number'].to_i, named['text']
    if verse = Verse.find_by(book: book, chapter: chapter, number: number)
      # verse.update(text: text)
    else
      verse = Verse.new(book: book, chapter: chapter, number: number, text: text, edition: "쉬운성경")
      verse.save
    end
  end

  attr_reader :file
end
