require File.dirname(__FILE__) + '/../../spec_helper'
require 'stringio'
require File.dirname(__FILE__) + "/shared/readchar"

ruby_version_is "1.8.7" do
  describe "StringIO#readbyte" do
    it_behaves_like :stringio_readchar, :readbyte

    it "reads the next 8-bit byte from self's current position" do
      io = StringIO.new("example")

      io.send(@method).should == 101

      io.pos = 4
      io.send(@method).should == 112
    end
  end

  describe "StringIO#readbyte when self is not readable" do
    it_behaves_like :stringio_readchar_not_readable, :readbyte
  end
end
