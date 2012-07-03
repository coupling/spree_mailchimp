class Spree::SubscriptionsController < Spree::BaseController
  before_filter :load_config

  def create
    @errors = []
    if @config[:mailchimp_api_key]
      hominid ||= Hominid::API.new(@config[:mailchimp_api_key])

      if params[:email].blank?
        @errors << t('missing_email')
      elsif params[:email] !~ /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
        @errors << t('invalid_email_address')
      else
        begin
          self.class.benchmark "Adding mailchimp subscriber" do
            hominid.list_subscribe(@config[:mailchimp_list_id], params[:email], {})
          end
        rescue Hominid::APIError => e
          @errors << e
        end
      end
    else
      @errors << "No API key defined"
    end
    @message = @errors.any? ? {:error => @errors.join(' / ')} : {:notice => t(:you_have_been_subscribed)}

    redirect_to :back, :flash => @message
  end

  def load_config
    @config = Spree::MailChimpConfiguration.new
  end
end
