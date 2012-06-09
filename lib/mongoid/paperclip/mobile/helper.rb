module Mongoid
  module Paperclip
    module Mobile
      module Helper
        extend ActiveSupport::Concern

        def mobile_app_helper(icon,splash,*args)
          content = String.new
          content.concat(content_tag(:meta,'',
                                     :name => "apple-mobile-web-app-capable",
                                     :content => "yes"))
          content.concat(content_tag(:meta,'',
                                     :name => "apple-touch-fullscreen",
                                     :content => "yes"))
          content.concat(content_tag(:meta,'',
                                     :name => "viewport",
                                     :content => "width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"))
          content.concat(content_tag(:meta,'',
                                     :name => "apple-mobile-web-app-status-bar-style",
                                     :content => "black"))

          content.concat("<!-- Mobile Web App Icons -->\n")

          content.concat(link_tag(:rel => "apple-touch-icon-precomposed",
                                            :sizes => "72x72",
                                            :href => icon.url(:ipad)))


          content.concat(link_tag(:rel => "apple-touch-icon-precomposed",
                                  :sizes => "114x114",
                                  :href => icon.url(:iphone_retina)))
          content.concat(link_tag(:rel => "apple-touch-icon-precomposed",
                                  :href => icon.url(:iphone)))
          content.concat(link_tag(:rel => "apple-touch-icon-precomposed",
                                  :sizes => "144x144",
                                  :href => icon.url(:ipad_retina)))
          content.concat("\n<!-- END Mobile Web App Icons -->")

          content.concat("\n<!-- Mobile Web App Splash Screen -->")

          content.concat("\n\t\t<!-- iPhone 3g/3gs -->")
          content.concat(link_tag(:rel => "apple-touch-startup-image",
                                  :href => splash[:portrait].url(:iphone)))
          #
          #content.concat("\n\t\t<!-- iPhone 4/4s -->")
          #content.concat(link_tag(:rel => "apple-touch-startup-image",
          #                        :href => splash[:portrait].url(:iphone_retina),
          #                        :media => "(max-device-width: 480px) and (-webkit-min-device-pixel-ratio: 2)"))

          content.concat("\n\t\t<!-- iPad-->")
          content.concat(link_tag(:rel => "apple-touch-startup-image",
                                  :href => splash[:portrait].url(:ipad),
                                  :media => "screen and (min-device-width: 481px) and (max-device-width: 768px) and (orientation:portrait)",
                                  ))
          content.concat(link_tag(:rel => "apple-touch-startup-image",
                                  :href => splash[:landscape].url(:ipad),
                                  :media => "screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)",
                                  ))
#<link rel="apple-touch-startup-image" href="touch-splash-ipad-land.png"  media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)" />
#<link rel="apple-touch-startup-image" href="touch-splash-ipad-port.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)" />
          content.concat("\n<!-- END Mobile Web App Splash Screen -->")
          content.html_safe
        end

        private
        def link_tag(options={})
          content_tag(:link,'',options)
        end
      end
    end
  end
end
