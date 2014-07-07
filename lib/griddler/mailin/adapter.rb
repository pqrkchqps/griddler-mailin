module Griddler
  module Mailin
    class Adapter
      def initialize(params)
        @raw_params = params
      end

      def self.normalize_params(params)
        adapter = new(params)
        adapter.normalize_params
      end

      def normalize_params
        {
          to: parse_recipients(params['to']),
          cc: parse_recipients(params['cc']),
          from: parse_recipients(params['from']).first,
          subject: params['subject'],
          text: params['text'],
          html: params['html'],
        }
      end

      private

      attr_reader :params

      def params
        @raw_params['mailinMsg']
      end

      def parse_recipients(mailin_to)
        mailin_to.map do | obj |
          "#{obj['name']} <#{obj['address']}>"
        end
      end
    end
  end
end
