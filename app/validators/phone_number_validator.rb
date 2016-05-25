class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A0|[1-9]\d{0,3}-\d{1,4}-\d{4}\z/
      record.errors[attribute] << (options[:message] || "is not an phone number")
    end
  end
end
