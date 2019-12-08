class YesNoFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless %w(yes no n/a).include?(value.downcase)
      object.errors[attribute] << (options[:message] || "is not a proper option.") 
    end
  end
end