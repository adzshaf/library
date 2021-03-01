require 'book_storage'
require 'book'

RSpec.describe 'BookStorage' do
    subject { BookStorage.new }

    context "initialize" do
        it "should have storage that is an empty hash" do
            storage = subject.storage
            expect(storage.is_a?(Hash)).to eq true
            expect(storage.empty?).to eq true
        end
    end 

    context "get_book_by_position" do
        let(:position) { "010101" }

        it "should return nil if get_book_by_position of empty storage is called" do
            result = subject.get_book_by_position(position)
            expect(result).to eq nil
        end
    end
end