module Mongoid::Paperclip::Mobile::SplashScreen
  extend ActiveSupport::Concern


  module ClassMethods
    def has_mobile_web_splash_screen(field, options={ })
      if options[:styles]
        Rails.logger.warn ":style option for has_mobile_web_splash_screen :#{field} will be ignored."
      end

      l_opts = options.merge({  :styles => landscape_styles,
                                :default_url       => placeholder_image_url("1024x748", :text => "Missing")
                             })
      p_opts = options.merge({  :styles => portrait_styles,
                                :default_url       => placeholder_image_url("768x1004", :text => "Missing")
                             })



      #make sure that mongoid paperclip is included
      unless self.ancestors.include?(::Mongoid::Paperclip)
        include ::Mongoid::Paperclip
      end

      has_mongoid_attached_file("#{field}_landscape", l_opts)
      has_mongoid_attached_file("#{field}_portrait", p_opts)
    end

    private
    def landscape_styles
      {
          :ipad                => ['1024x748#', :png],
          :ipad_retina         => ['2048x1496#', :png],

          :android_rect_hdpi   => ['800x480#', :png],
          :android_rect_ldpi   => ['400x240#', :png],

          :android_square_hdpi => ['800x480#', :png],
          :android_square_mdpi => ['480x320#', :png],
          :android_square_ldpi => ['320x240#', :png],
      }
    end

    def portrait_styles
      {
          :iphone              => ['320x460#', :png],
          :iphone_retina       => ['640x960#', :png],
          :ipad                => ['768x1004#', :png],
          :ipad_retina         => ['1536x2008#', :png],

          :android_rect_hdpi   => ['480x800#', :png],
          :android_rect_ldpi   => ['240x400#', :png],

          :android_square_hdpi => ['480x800#', :png],
          :android_square_mdpi => ['320x480#', :png],
          :android_square_ldpi => ['240x320#', :png],
      }
    end
  end
end