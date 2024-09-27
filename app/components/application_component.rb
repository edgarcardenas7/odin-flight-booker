# app/components/application_component.rb
class ApplicationComponent < Phlex::HTML
    include Phlex::Rails::Helpers
    include Rails.application.routes.url_helpers
    
    def turbo_frame_tag(id, options = {}, &block)
      tag = "<turbo-frame id=\"#{id}\""
      options.each do |key, value|
        tag += " #{key}=\"#{value}\""
      end
      tag += ">"
      tag += capture(&block) if block_given?
      tag += "</turbo-frame>"
      tag.html_safe
    end
  end
  