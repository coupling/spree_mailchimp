module Spree::MailChimp
end
module SpreeMailChimpExtension
  class Engine < Rails::Engine
    engine_name 'spree_mailchimp'

    initializer "spree.active_shipping.preferences", :before => :load_config_initializers do |app|
      Spree::MailChimp::Config = Spree::MailChimpConfiguration.new
    end

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      #loads application's deface view overrides
      Dir.glob File.expand_path("../../app/overrides/*.rb", __FILE__) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
