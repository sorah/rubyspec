require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/common'

ruby_version_is "1.8.7" do
  describe "Dir#inspect" do
    before :all do
      DirSpecs.create_mock_dirs
    end

    after :all do
      DirSpecs.delete_mock_dirs
    end

    it "returns a String" do
      Dir.new(Dir.getwd).inspect.should be_an_instance_of(String)
    end

    it "includes the class name" do
      Dir.new(Dir.getwd).inspect.should =~ /Dir/
    end

    it "includes the directory name" do
      Dir.new(Dir.getwd).inspect.should include(Dir.getwd)
    end
  end
end
