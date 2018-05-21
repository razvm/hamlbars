require 'haml'
require 'sprockets'

module Hamlbars

  if defined? Rails::Engine
    class Engine < Rails::Engine
    end
  end

  ROOT = File.expand_path(File.dirname(__FILE__))

  autoload :Ext,      File.join(ROOT, 'hamlbars', 'ext')
  autoload :Template, File.join(ROOT, 'hamlbars', 'template')

  if Haml::VERSION > '4.0.7'
    Haml::AttributeBuilder.send(:include, Ext::Compiler)
  else
    Haml::Compiler.send(:include, Ext::Compiler)
  end

  if defined? Sprockets
    if Sprockets.respond_to?(:register_engine)
      args = ['.hamlbars', Template]
      args << { silence_deprecation: true } if Sprockets::VERSION.start_with?("3")
      Sprockets.register_engine(*args)
    end
  end

end
