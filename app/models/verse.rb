class Verse < ApplicationRecord
  def self.books
    @books ||= group(:book).pluck(:book)
  end
end
