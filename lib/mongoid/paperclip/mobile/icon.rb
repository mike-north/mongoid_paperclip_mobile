module Mongoid::Paperclip::Mobile::Icon
  extend ActiveSupport::Concern

  module ClassMethods
    def has_mobile_web_icon(field, options={ })
      if options[:styles]
        Rails.logger.warn ":style option for has_mobile_web_icon :#{field} will be ignored."
      end

      opts = options.merge({
                               :styles => mobile_styles,
                               :default_url       => placeholder_image_url("96x96", :text => "Missing")
      })


      #make sure that mongoid paperclip is included
      unless self.ancestors.include?(::Mongoid::Paperclip)
        include ::Mongoid::Paperclip
      end

      has_mongoid_attached_file(field, opts)

    end

    private
    def mobile_styles
      {
          :android_ldpi  => ['36x36#', :png],
          :android_mdpi  => ['48x48#', :png],
          :android_hdpi  => ['72x72#', :png],
          :android_xhdpi => ['96x96#', :png],

          :iphone        => ['57x57#', :png],
          :iphone_retina => ['114x114#', :png],
          :ipad          => ['72x72#', :png],
          :ipad_retina   => ['144x144#', :png]
      }
    end
  end
end