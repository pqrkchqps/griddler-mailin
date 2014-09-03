module Griddler
  module Mailin
    class Adapter
      def initialize(params)
        if params['mailinMsg'].is_a? String
          @params = JSON.parse(params['mailinMsg'])
        else
          @params = params['mailinMsg']
        end
      end

      def self.normalize_params(params)
        adapter = new(params)
        adapter.normalize_params
      end

      def normalize_params
        h = {
          to: parse_recipients(params['to']),
          cc: parse_recipients(params['cc']),
          from: parse_recipients(params['from']).first,
          subject: params['subject'],
          text: params['text'],
          html: params['html'],
        }
        h.delete(:text) if h['html'].present?
        h
      end

      private

      attr_reader :params

      def parse_recipients(mailin_to)
        mailin_to.map do | obj |
          "#{obj['name']} <#{obj['address']}>"
        end
      end
    end
  end
end
