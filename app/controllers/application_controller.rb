class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
    rescue_from ActionController::UnpermittedParameters, with: :render_unpermitted_params

private
    def render_record_not_found(record)
        render json: { errors: record.message }, status: :not_found
    end
    def render_record_invalid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
    def render_unpermitted_params(record)
        # byebug
        render json: { errors: "Unpermitted Parameters: #{record.params}" }, status: :unprocessable_entity
    end

end
