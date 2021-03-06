require File.dirname(__FILE__) + '/../../spec_helper'

with_feature :encoding do
  describe "String#ord" do
    it "returns a Fixnum" do
      'a'.ord.should be_an_instance_of(Fixnum)
    end

    it "returns the codepoint of the first character in the String" do
      'a'.ord.should == 97
    end


    it "ignores subsequent characters" do
      "\u{287}a".ord.should == "\u{287}".ord
    end

    ruby_version_is "1.9" do
      it "understands multibyte characters" do
        "\u{9879}".ord.should == 39033
      end

      it "is equivalent to #codepoints.first" do
        "\u{981}\u{982}".ord.should == "\u{981}\u{982}".codepoints.first
      end
    end

    it "raises an ArgumentError if called on an empty String" do
      lambda { ''.ord }.should raise_error(ArgumentError)
    end
  end
end
