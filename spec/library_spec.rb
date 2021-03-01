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

        it "returns Shelf 1 with 1 row and 2 column is added if build_library(1, 1, 2)" do
            result = subject.build_library(1, 1, 2)
            expect(result).to eq "Shelf 1 with 1 row and 2 columns is added"
        end

        it "returns Shelf 1 with 1 row and 3 columns is added if build_library(1, 1, 3)" do
            result = subject.build_library(1, 1, 3)
            expect(result).to eq "Shelf 1 with 1 row and 3 columns is added"
        end

        it "returns Shelf 1 with 2 rows and 1 column is added if build_library(1, 2, 1)" do
            result = subject.build_library(1, 2, 1)
            expect(result).to eq "Shelf 1 with 2 rows and 1 column is added"
        end

        it "returns Shelf 1 with 2 rows and 2 columns is added if build_library(1, 2, 2)" do
            result = subject.build_library(1, 2, 2)
            expect(result).to eq "Shelf 1 with 2 rows and 2 columns is added"
        end

        it "returns Shelf 1 with 3 rows and 3 columns is added\nShelf 2 with 3 rows and 3 columns is added\nShelf 3 with 3 rows and 3 columns is added if build_library(2, 3, 3)" do
            result = subject.build_library(3, 3, 3)
            expect(result).to eq "Shelf 1 with 3 rows and 3 columns is added\nShelf 2 with 3 rows and 3 columns is added\nShelf 3 with 3 rows and 3 columns is added"
        end

        it "has 1 shelf, 2 row, 3 columns after build_library(1, 2, 3) is called" do
            subject.build_library(1, 2, 3)
            expect(subject.shelf_size).to eq 1
            expect(subject.row_size).to eq 2
            expect(subject.column_size).to eq 3
        end

        it "returns 010101 for available_position after build_library(1, 2, 3) is called" do
            subject.build_library(1, 2, 3)
            expect(subject.available_position).to eq "010101"
        end
    end

    context "put_book" do
        before(:each) do
            subject.build_library(2, 2, 2)
        end

        it "returns Allocated address: 010101" do
            result = subject.put_book(9780747532743, "Harry Potter 1", "J. K. Rowling")
            expect(result).to eq "Allocated address: 010101"
        end

        it "returns Allocated address: 010102 for second book" do
            subject.put_book(9780747532743, "Harry Potter 1", "J. K. Rowling")
            result = subject.put_book(9780747532744, "Harry Potter 2", "J. K. Rowling")
            expect(result).to eq "Allocated address: 010102"
        end
    end

    context "increment_position" do
        before(:each) do
            subject.build_library(2, 2, 2)
        end

        it "set available_position to new column after increment_position is called" do
            subject.available_position = "010101"
            subject.increment_position
            expect(subject.available_position).to eq "010102"
        end

        it "set available_position to new row after put book in last column" do
            subject.available_position = "010102"
            subject.increment_position
            expect(subject.available_position).to eq "010201"
        end

        it "set available_position to new shelf after put book in last row" do
            subject.available_position = "010202"
            subject.increment_position
            expect(subject.available_position).to eq "020101"
        end
    end
end