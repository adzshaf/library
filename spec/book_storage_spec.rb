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
end