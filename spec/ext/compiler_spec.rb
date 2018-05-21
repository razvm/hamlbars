require 'spec_helper'

describe Haml::Compiler do
  context 'HAML 4 or older', type: :haml4 do
    it "should include Hamlbars::CompilerExtension" do
      expect(Haml::Compiler.ancestors).to include(Hamlbars::Ext::Compiler)
    end

    it "should define ::build_attributes_with_handlebars_attributes" do
      expect(Haml::Compiler.respond_to?(:build_attributes_with_handlebars_attributes)).to be_truthy
    end

    it "should define ::build_attributes_without_handlebars_attributes" do
      expect(Haml::Compiler.respond_to?(:build_attributes_without_handlebars_attributes)).to be_truthy
    end

    it "should alias ::build_attributes to ::build_attributes_with_handlebars_attributes" do
      expect(Haml::Compiler.method(:build_attributes)).to eq(Haml::Compiler.method(:build_attributes_with_handlebars_attributes))
    end
  end

  context 'HAML 5 or newer', type: :haml5 do
    it "should include Hamlbars::CompilerExtension" do
      expect(Haml::AttributeBuilder.ancestors).to include(Hamlbars::Ext::Compiler)
    end

    it "should define ::build_attributes_with_handlebars_attributes" do
      expect(Haml::AttributeBuilder.respond_to?(:build_attributes_with_handlebars_attributes)).to be_truthy
    end

    it "should define ::build_attributes_without_handlebars_attributes" do
      expect(Haml::AttributeBuilder.respond_to?(:build_attributes_without_handlebars_attributes)).to be_truthy
    end

    it "should alias ::build_attributes to ::build_attributes_with_handlebars_attributes" do
      expect(Haml::AttributeBuilder.method(:build_attributes)).to eq(Haml::AttributeBuilder.method(:build_attributes_with_handlebars_attributes))
    end
  end
end
