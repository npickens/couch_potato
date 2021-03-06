module CouchPotato
  module View
    class BaseViewSpec
      attr_reader :reduce_function, :design_document, :view_name, :view_parameters, :klass, :options
      private :klass, :options

      def initialize(klass, view_name, options, view_parameters)
        @klass = klass
        @design_document = klass.to_s.underscore
        @view_name = view_name
        @options = options
        @view_parameters = {}
        [:group, :include_docs, :descending, :group_level, :limit].each do |key|
          @view_parameters[key] = options[key] if options.include?(key)
        end
        @view_parameters.merge!(view_parameters)
      end

      def process_results(results)
        results
      end
    end
  end
end