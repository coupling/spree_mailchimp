class Spree::Admin::MailChimpSettingsController < Admin::BaseController
  before_filter :load_config
  before_filter :load_preferences, :only => [:edit, :show]

  def edit
  end

  def show
  end

  def update
    params.each do |name, value|
      next unless @config.has_preference? name
      @config[name] = value
    end

    respond_to do |format|
      format.html {
        redirect_to admin_mail_chimp_settings_path
      }
    end
  end

  private

  def load_config
    @config = Spree::MailChimpConfiguration.new
  end

  def load_preferences
    @preferences = ['mailchimp_api_key', 'mailchimp_list_id', 'mailchimp_double_opt_in', 'mailchimp_send_welcome',
      'mailchimp_send_notify', 'mailchimp_merge_vars']
  end
end
