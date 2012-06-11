class AddMailChimpColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :is_mail_list_subscriber, :boolean, :null => false, :default => false
    add_column :spree_users, :mailchimp_subscriber_id, :string, :length => 31
  end
end
