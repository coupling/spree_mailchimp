Spree::UsersController.class_eval do
  include Spree::MailChimpSync::Sync
end