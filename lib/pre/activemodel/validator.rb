module Pre
  module ActiveModel
    class Validator < ::ActiveModel::EachValidator
      def initialize options = {}
        @attributes = options[:attributes]
        @options = options
        @validator = Pre::Validator.new options
      end
      def validate(record)
        attributes.all? do |attribute|
          unless @validator.valid? record.send(attribute)
            record.errors[attribute] << error_message_for(attribute)
          end
        end
      end
      def error_message_for attribute
        @options[:message] || "#{attribute} must have valid format and domain"
      end
    end
  end
end
