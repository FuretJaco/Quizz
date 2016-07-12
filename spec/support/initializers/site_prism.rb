require 'site_prism'

SitePrism.configure do |config|
  config.use_implicit_waits = true
end


module  SitePrismExtension


  def purpose_element(purpose, **options)
    element purpose, %Q'[data-purpose="#{purpose}"]', **options
  end

  def purpose_elements(purpose, elements_name=purpose.to_s.pluralize)
    elements elements_name, %Q'[data-purpose="#{purpose}"]'
  end

  def purpose_section(purpose, section_class)
    section purpose, section_class, %Q'[data-purpose="#{purpose}"]'
  end

  def purpose_sections(purpose, section_class, elements_name=purpose.to_s.pluralize)
    sections elements_name, section_class, %Q'[data-purpose="#{purpose}"]'
  end


end



SitePrism::Page.send :extend, SitePrismExtension
SitePrism::Section.send :extend, SitePrismExtension