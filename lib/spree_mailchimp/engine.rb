module SpreeMailchimp
  class Engine < Rails::Engine
    engine_name 'spree_mailchimp'

    config.autoload_paths += %W(#{config.root}/lib)

    Spree::MailChimp::CONFIG = Spree::MailChimpConfiguration.new unless defined?(Spree::MailChimp::CONFIG)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    Spree::BaseController.class_eval do
        helper MailChimpHelper
    end

    UsersController.send(:include, MailChimpSync::Sync)

    User.class_eval do
        attr_accessible :is_mail_list_subscriber
    end

    config.to_prepare &method(:activate).to_proc
  end
end
