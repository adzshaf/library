# frozen_string_literal: true

class BookStorage
  attr_reader :storage

  def initialize
    @storage = {}
  end

  def get_book_by_position(position)
    @storage[position]
  end

  def add_book(position, book)
    @storage[position] = book
  end

  def delete_book_from_position(position)
    @storage.delete(position)
  end

  def to_s
    if @storage.size.positive?
      result = []

      sort_storage

      @storage.each do |key, book|
        result.push("#{key}: #{book}")
      end
      result.join("\n")
    else
      'There is no book!'
    end
  end

  def find_book_by_isbn(isbn)
    position_result = nil

    @storage.each do |position, book|
      position_result = position if book.has_isbn?(isbn)
    end

    position_result
  end

  def search_book_by_author(author)
    book_result = []

    sort_storage

    @storage.each do |key, book|
      book_result.push("#{key}: #{book}") if book.has_author?(author)
    end

    book_result
  end

  def search_book_by_title(title)
    title_result = []

    sort_storage

    @storage.each do |key, book|
      title_result.push("#{key}: #{book}") if book.has_title?(title)
    end

    title_result
  end

  def size
    @storage.size
  end

  private

  def sort_storage
    @storage = @storage.sort_by { |position, _book| position }.to_h
  end
end
