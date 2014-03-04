module CollectHelper
  def input_for(response)
    id      = "#{response.question.id}_value"
    name    = "responses[][value]"
    values  = response.question.values.blank? ? nil : response.question.values.split(',')

    case response.question.kind
      when "text"     then text_field_tag(name, response.value, id: id)
      when "tel"      then telephone_field_tag(name, response.value, id: id)
      when "email"    then email_field_tag(name, response.value, id: id)
      when "textarea" then text_area_tag(name, response.value, id: id)
      when "radio"    then radio_group(name, id, values, response.value)
      else ""
    end
  end

  protected

  def radio_group(name, id, values, selected)
    values.each_with_index.map { |value, index|
      indexed_id = "#{id}_#{index}"
      button = radio_button_tag name, value, selected == value, id: indexed_id
      label_tag indexed_id do
        button + value
      end
    }.reduce &:+
  end
end