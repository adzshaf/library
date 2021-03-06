# frozen_string_literal: true

require 'book'

RSpec.describe Book do
  let(:isbn) { 9_780_747_532_744 }
  let(:title) { 'Harry Potter' }
  let(:author) { 'J. K. Rowling' }

  subject { Book.new isbn, title, author }

  context 'initialize' do
    it 'should be able to get isbn, title, author' do
      expect(subject.isbn).to eq isbn
      expect(subject.title).to eq title
      expect(subject.author).to eq author
    end
  end

  context 'has_title?' do
    it "returns true if has_title?('Harry Potter') is called" do
      result = subject.has_title?('Harry Potter')
      expect(result).to eq true
    end

    it "returns false if has_title?('Lord of the Rings') is called" do
      result = subject.has_title?('Lord of the Rings')
      expect(result).to eq false
    end

    it "returns true if has_title?('Harry') is called" do
      result = subject.has_title?('Harry')
      expect(result).to eq true
    end

    it "returns true if has_title?('HARRY') is called" do
      result = subject.has_title?('HARRY')
      expect(result).to eq true
    end
  end

  context 'has_author?' do
    it "returns true if has_author?('J. K. Rowling') is called" do
      result = subject.has_author?('J. K. Rowling')
      expect(result).to eq true
    end

    it "returns false if has_author?('Martin Fowler') is called" do
      result = subject.has_author?('Martin Fowler')
      expect(result).to eq false
    end

    it "returns true if has_author?('Rowling') is called" do
      result = subject.has_author?('Rowling')
      expect(result).to eq true
    end

    it "returns true if has_author?('ROWLING') is called" do
      result = subject.has_author?('ROWLING')
      expect(result).to eq true
    end
  end

  context 'to_s' do
    it 'returns information of isbn, title, author with | separator' do
      result = subject.to_s
      expect(result).to eq '9780747532744 | Harry Potter | J. K. Rowling'
    end

    it 'returns information of isbn, title, author with | separator for any book' do
      book = Book.new(9_780_747_532_742, 'Clean Code', 'Uncle Bob')
      expect(book.to_s).to eq '9780747532742 | Clean Code | Uncle Bob'
    end
  end

  context 'has_isbn?' do
    it "returns true if has_isbn?('9780747532744') is called" do
      result = subject.has_isbn?(9_780_747_532_744)
      expect(result).to eq true
    end

    it "returns false if has_isbn?('9780747532745') is called" do
      result = subject.has_isbn?(9_780_747_532_745)
      expect(result).to eq false
    end
  end
end
