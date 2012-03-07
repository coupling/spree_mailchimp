class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_mail_list_subscriber, :boolean, :null => false, :default => false
    add_column :users, :mailchimp_subscriber_id, :string, :length => 31
  end
end
