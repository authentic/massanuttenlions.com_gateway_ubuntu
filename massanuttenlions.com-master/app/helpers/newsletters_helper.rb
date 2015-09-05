module NewslettersHelper
  def header_value(&block)
    content = with_output_buffer(&block)
    content_tag(:div, content, :class => 'admin')
  end


end
