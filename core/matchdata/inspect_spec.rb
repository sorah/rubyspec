require File.dirname(__FILE__) + '/../../spec_helper'

describe "MatchData#inspect" do
  before :each do
    @match_data = /(.)(.)(\d+)(\d)/.match("THX1138.")
  end

  it "returns a String" do
    @match_data.inspect.should be_kind_of(String)
  end

  ruby_version_is '1.8.7' do
    it "returns a human readable representation that contains entire matched string and the captures" do
      # yeah, hardcoding the inspect output is not ideal, but in this case
      # it makes perfect sense. See JRUBY-4558 for example.
      @match_data.inspect.should == '#<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">'
    end
  end
end
