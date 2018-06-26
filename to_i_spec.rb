require "rspec"
require "pry"
require_relative 'to_i'

describe ToI do
  describe ".parse" do
    it "returns a negative number if passed" do
      expect(ToI.parse("-7777")).to eq -7777
    end

    it "returns zero if nil is passed" do
      expect(ToI.parse(nil)).to eq 0
    end

    it "returns 0 if a blank string is passed" do
      expect(ToI.parse('')).to eq 0
    end

    it "returns 0 if only non-numeric characters are passed" do
      expect(ToI.parse('abc')).to eq 0
    end

    it "ignores single underscores" do
      expect(ToI.parse('4_0')).to eq 40
    end

    it "stops parsing when it encounters a non-numeric character" do
      expect(ToI.parse("123a2")).to eq 123
    end

    it "stops parsing when it encounters double-underscores" do
      expect(ToI.parse('4__0')).to eq 4
    end
  end

  describe ".convert_to_integer" do
    it "converts a string of numbers into an integer" do
      expect(ToI.parse("12")).to eq 12
      expect(ToI.parse("12345")).to eq 12345
    end
  end
end
