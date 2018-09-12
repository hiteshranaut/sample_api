module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
         # puts "*******"
         # puts key
         # puts value
         # puts "*******"
         # puts results
         # puts "^^^^^^^^"
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end