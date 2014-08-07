require 'uri'

# Credit to https://github.com/aitherios
class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^#{URI::regexp}$/
      record.errors[attribute] << (options[:message] || "is not an url")
    end
  end
end

