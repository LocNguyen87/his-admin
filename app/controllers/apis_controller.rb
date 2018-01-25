class ApisController < ApplicationController
  protect_from_forgery prepend: true

  def createRegistration
    Parse.use_shortnames!
    parse_params = {
      fullName: params[:fullName],
      email: params[:email],
      phone: params[:phone],
      address: params[:address],
      region: params[:region],
      type: params[:type],
      nation: params[:nation],
      hasVisa: params[:hasVisa] == 'true' ? true : false,
      budget: params[:budget].parameterize.underscore.to_sym,
      time: params[:time].parameterize.underscore.to_sym,
      request: params[:request],
      original_url: params[:original_url],
      utm_source: params[:utm_source],
      utm_medium: params[:utm_medium],
      utm_campaign: params[:utm_campaign],
      gclid: params[:gclid],
      device: params[:device],
      system: params[:system],
      readingTime: params[:readingTime].to_f,
      scrolled: params[:scrolled].to_f
    }
    registration = Registration.new(parse_params)
    registration.save
  end

  private

end
