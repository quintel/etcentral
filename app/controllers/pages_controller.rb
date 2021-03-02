class PagesController < ApplicationController
  invisible_captcha(
    only: [:send_feedback],
    scope: :feedback,
    honeypot: :country,
    on_spam: :send_feedback_spam
  )

  def root
    @people = Person.all.sort
  end

  def show
    unless @page = Page.find(params[:id], I18n.locale)
      other_locale = I18n.locale.to_s == 'en' ? 'nl' : 'en'
      unless @page = Page.find(params[:id], other_locale)
        # raise ActionController::RoutingError.new("Page '#{ params[:id] }' not found")
        render 'pages/not_found.html'
      else
        flash[:notice] = I18n.t('pages.not_available_in_this_locale')
      end
    end
  end

  def contact
  end

  def send_feedback
    if FeedbackMailer.allowed_message?(feedback_parameters[:message])
      FeedbackMailer.feedback_email(feedback_parameters).deliver
    end

    flash[:notice] = I18n.t('contact.feedback_confirm')
    redirect_to action: 'contact'
  end

  def send_feedback_spam
    redirect_to contact_url
  end

  private

  def feedback_parameters
    params.require(:feedback).permit(:name, :email, :message)
  end
end
