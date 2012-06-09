require "mongoid/paperclip/mobile/icon"
require "mongoid/paperclip/mobile/splash_screen"
require "mongoid/paperclip/mobile/helper"
module Mongoid::Paperclip::Mobile
  include Mongoid::Paperclip::Mobile::Icon
  include Mongoid::Paperclip::Mobile::SplashScreen

end

ActionView::Base.send :include, Mongoid::Paperclip::Mobile::Helper
