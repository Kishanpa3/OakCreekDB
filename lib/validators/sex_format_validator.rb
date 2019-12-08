class SexFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless %w(male female n/a).include?(value.downcase)
      object.errors[attribute] << (options[:message] || "is not a proper sex.") 
    end
  end
end