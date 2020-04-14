module PagSeguro
  class Session
    include Extensions::Assignment

    # The session id.
    attr_accessor :id

    # The PageSeguro::Errors object.
    attr_writer :errors

    def errors
      @errors ||= Errors.new
    end

    # Create a payment session.
    # Return a PagSeguro::Session instance.
    def self.create
      credentials = PagSeguro::ApplicationCredentials.new(PagSeguro.app_id, PagSeguro.app_key)
      response = Request.post_xml("sessions", api_version, credentials)
      session = Session.new
      response = Response.new(response, session).serialize

      session
    end

    def update_attributes(attrs)
      attrs.map { |name, value| send("#{name}=", value) }
    end

    private
    def self.api_version
      nil
    end
  end
end
