require "caesar_cipher"

describe Decipherable do

  describe ".caesar_cipher" do

    context "given one argument" do
      context "given an empty string" do
        it "returns an empty string" do
          expect(Decipherable::caesar_cipher("")).to eql("")
        end
      end

      context "given a string" do
        it "returns the same string" do
          expect(Decipherable::caesar_cipher("string")).to eql("string")
        end
      end
    end

    context "given two arguments" do
      context "given a string and zero" do
        it "returns the same string" do
          expect(Decipherable::caesar_cipher("string", 0)).to eql("string")
        end
      end

      context "given a string and positive number" do
        it "returns the string shifted by the number" do
          expect(Decipherable::caesar_cipher("abcde", 1)).to eql("bcdef")
        end
      end

      context "given a shift that overflows the alphabet" do
        it "loops back to 'a'" do
          expect(Decipherable::caesar_cipher("xyz", 3)).to eql("abc")
        end
      end

      # -> Functionality not implemented
      # context "given a string and negative number" do
      #   it "return the string negatively shifted by the number" do
      #     expect(Decipherable::caesar_cipher("abcde", -1)).to eql("zabcd")
      #   end
      # end
    end
  end
end
