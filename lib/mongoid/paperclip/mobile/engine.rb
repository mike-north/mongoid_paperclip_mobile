module Mongoid
  module Paperclip
    module Mobile
      class Engine < ::Rails::Engine
        isolate_namespace Mongoid::Paperclip::Mobile
      end
    end
  end
end
