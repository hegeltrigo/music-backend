class SessionsController < Devise::SessionsController
  # respond_to :json

  def create
     self.resource = warden.authenticate!(auth_options)
     sign_in(resource_name, resource)
     yield resource if block_given?
     json_response(resource.attributes.merge(token: current_token))
  end

  private

  def respond_with(resource, _opts = {})
    # render json: resource
    json_response(resource)
  end

  def respond_to_on_destroy
    head :no_content
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
