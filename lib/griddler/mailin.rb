require 'griddler'
require 'griddler/mailin/version'
require 'griddler/mailin/adapter'

module Griddler
  module Mailin
  end
end

Griddler.adapter_registry.register(:mailin, Griddler::Mailin::Adapter)
