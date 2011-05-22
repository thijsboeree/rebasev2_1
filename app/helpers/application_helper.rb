# helpers/application_helper.rb
module ApplicationHelper

  def default_text_field(name, value, form, options = {})
    if association = options[:add_on_data]
      options.delete :add_on_data
      options[:class] = [options[:class], "add_fields_on_data"].compact.join(' ')
      options[:'data-association'] = association.to_s.singularize
      options[:'data-associations'] = association.to_s.pluralize

      new_object = form.object.class.reflect_on_association(association).klass.new
      options[:'data-template'] = CGI.escapeHTML(render_association(association, form, new_object))
    end
    options[:value] = value
    options[:class] = "gray-input"
    options[:onfocus] = "if (this.value=='#{value}') this.value = '';this.style.color = 'black';"
    options[:onblur] = "if (this.value=='') {this.value = '#{value}';this.style.color = '';}"
    form.text_field(name, options)
  end

 
  
end



