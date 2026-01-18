module FormHelper
  # Tailwind CSS class constants for form components
  FORM_CARD_CLASSES = "bg-white p-6 rounded-lg shadow-sm border max-w-xl mx-auto"
  FORM_GROUP_CLASSES = "mb-4"
  FORM_LABEL_CLASSES = "block text-sm font-medium text-gray-700 mb-1"
  FORM_INPUT_CLASSES = "w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 px-3 py-2 border"
  FORM_SUBMIT_CLASSES = "w-full inline-flex items-center justify-center rounded-md bg-red-500 px-4 py-2 text-white font-medium hover:bg-red-600 transition cursor-pointer border-0"
  FORM_ERRORS_CLASSES = "border border-red-300 bg-red-50 p-3 rounded-md text-red-600 mt-4"
  FORM_ERRORS_LIST_CLASSES = "list-disc list-inside"

  def form_card(&block)
    content_tag(:div, class: FORM_CARD_CLASSES, &block)
  end

  def form_group(&block)
    content_tag(:div, class: FORM_GROUP_CLASSES, &block)
  end

  def form_label_classes
    FORM_LABEL_CLASSES
  end

  def form_input_classes
    FORM_INPUT_CLASSES
  end

  def form_submit_classes
    FORM_SUBMIT_CLASSES
  end

  def form_errors(object)
    return unless object.errors.any?

    content_tag(:div, class: FORM_ERRORS_CLASSES) do
      content_tag(:ul, class: FORM_ERRORS_LIST_CLASSES) do
        object.errors.full_messages.map do |msg|
          content_tag(:li, msg)
        end.join.html_safe
      end
    end
  end
end
