class WeightUnitsFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless %w(g kg lbs).include?(value.downcase)
      object.errors[attribute] << (options[:message] || "is not a proper weight unit.") 
    end
  end
end