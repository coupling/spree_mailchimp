Deface::Override.new(:virtual_path => "spree/admin/configurations/index",
                     :name => "insert_mailchimp_admin_settings",
                     :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "
          <tr>
            <td><%= link_to t(:mailchimp_settings), admin_mail_chimp_settings_path %></td>
            <td><%= t(:mailchimp_settings_description) %></td>
          </tr>")

# Deface::Override.new(:virtual_path => "spree/shared/_user_form",
#                     :name => "add_mailchimp_subscribe_checkbox",
#                     :insert_after => "[data-hook='signup_below_password_fields']",
#                     :partial => "spree/users/subscribe_to_newsletter_field")