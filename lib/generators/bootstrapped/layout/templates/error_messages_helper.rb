module ErrorMessagesHelper
  # Render error messages for the given objects. The :message and :header_message options are allowed.
  def error_messages_for(*objects)
    options = objects.extract_options!
    options[:header_message] ||= I18n.t(:"activerecord.errors.header", :default => "Invalid Fields")
    options[:message] ||= I18n.t(:"activerecord.errors.message", :default => "Correct the following errors and try again.")
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten
    unless messages.empty?
      content_tag(:div, :class => "error_messages") do
        list_items = messages.map { |msg| content_tag(:li, msg.html_safe) }
        content_tag(:h2, options[:header_message].html_safe) + content_tag(:p, options[:message].html_safe) + content_tag(:ul, list_items.join.html_safe)
      end
    end
  end
  
  def display_flash_message
    flash.each do |key, value|  
      css_class = key.eql?('notice') ? 'success' : 'error'
      render :partial => 'share/flash', :locals => { :css => css_class, :message => value }
    end
    nil
  end

  module FormBuilderAdditions
    def error_messages(options = {})
      @template.error_messages_for(@object, options)
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)
