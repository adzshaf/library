require 'library'

RSpec.describe Library do
    subject { Library.new }

    context "build_library" do
        it "returns Shelf 1 with 1 row and 1 column is added if build_library(1, 1, 1)" do
            result = subject.build_library(1, 1, 1)
            expect(result).to eq "Shelf 1 with 1 row and 1 column is added"
        end

        it "returns Shelf 1 with 2 rows and 1 column is added if build_library(1, 2, 1)" do
            result = subject.build_library(1, 2, 1)
            expect(result).to eq "Shelf 1 with 2 rows and 1 column is added"
        end
    end
end