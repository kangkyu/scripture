class Verse < ApplicationRecord
  def self.books
    @books ||= group(:book).pluck(:book)
  end

  def next
    Verse.where("id > ?", id).first
  end

  def prev
    Verse.where("id < ?", id).last
  end

  def address
    "(#{book} #{chapter}: #{number})"
  end
end
