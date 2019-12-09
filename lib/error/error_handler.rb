# Error module to Handle errors globally
# Rescue StandardError acts as a Fallback mechanism to handle any exception
module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |e|
          respond(:record_not_found, 404, e.to_s)
          # respond_to do |format|
          #   format.html { redirect_to error404_path }
          #   format.js { render :js => "window.location = '#{error404_path}'" }
          #   format.json { respond(:standard_error, 404, e.to_s) }
          # end
        end
        rescue_from CustomError do |e|
          respond(e.error, e.status, e.message.to_s)
        end
        rescue_from StandardError do |e|
          respond(:standard_error, 500, e.to_s)
          # respond_to do |format|
          #   format.html { redirect_to error500_path }
          #   format.js { render :js => "window.location = '#{error500_path}'" }
          #   format.json { respond(:standard_error, 500, e.to_s) }
          # end
        end
      end
    end

    private

    def respond(_error, _status, _message)
      json = Helpers::Render.json(_error, _status, _message)
      render json: json, status: _status
    end
  end
end