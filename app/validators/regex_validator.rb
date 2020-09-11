class NameCheckValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    record.errors[attribute] << 'is invalid' if :price.match?(/\A[0-9]+\z/) == false
  end
end
