require 'spec_helper'

describe "Sprockets" do
  context 'version 2', type: :sprockets2 do
    it "should register .hamlbars extension" do
      expect(Sprockets.engines('.hamlbars')).to be(Hamlbars::Template)
    end
  end
  context 'version 3 or later', type: :sprockets3 do
    it "should register .hamlbars extension" do
      expect(Sprockets.engines['.hamlbars'].nil?).to be_falsey
    end
  end
end
