class RegistrationsController < Devise::RegistrationsController
  # respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save
    # render_resource(resource)
    json_response(resource, :created)
  end
end
