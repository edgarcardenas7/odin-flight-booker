class ApplicationLayout < Phlex::HTML
  

  def view_template(&block)
    doctype
    html do
      head do
        title { "Flight Booker" }
        # Add any other head elements you need
      end
      body(&block)
    end
  end
end