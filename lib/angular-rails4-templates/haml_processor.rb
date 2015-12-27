require 'angular-rails-templates/compact_javascript_escape'
begin
  require 'haml'
rescue LoadError; end

module AngularRails4Templates
  class HamlProcessor < Processor

    include CompactJavaScriptEscape

    def render_html(input)
      template = input[:data]
      haml_engine = Haml::Engine.new(template)
      output = haml_engine.render
      escape_javascript output
    rescue Haml::SyntaxError => ex
      raise Haml::SyntaxError.new("#{input[:filename]} #{ex.message}", ex.line)
    end

  end
end
