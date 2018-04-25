require "my_enumerable"

describe Enumerable do

  let(:array) do
    ["a", "b", "c", 1, 2, 3]
  end

  describe "#my_each" do

    context "called with a block" do
      it "returns self" do
        expect(array.my_each {}).to eql(array)
      end

      it "iterates through the object" do
        new_array = []

        array.my_each do |element|
          new_array << element
        end

        expect(new_array).to eql(array)
      end
    end

    context "called without a block" do
      it "returns an enumerator" do
        expect(array.my_each.class).to eql(Enumerator)
      end
    end
  end

  describe "#my_each_with_index" do

    context "called with a block" do

      it "returns self" do
        expect(array.my_each_with_index {}).to eql(array)
      end

      it "passes an index to the block" do
        new_array = []

        array.my_each_with_index do |element, index|
          new_array << index
        end

        expect(new_array).to eql([0, 1, 2, 3, 4, 5])
      end
    end

    context "called without a block" do
      it "returns an enumerator" do
        expect(array.my_each_with_index.class).to eql(Enumerator)
      end
    end
  end

  describe "#my_select"
end
