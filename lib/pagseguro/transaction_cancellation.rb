module PagSeguro
  class TransactionCancellation
    include Extensions::Assignment
    include Extensions::Credentiable

    attr_accessor :transaction_code
    attr_accessor :result

    def register
      response_request = Request.post("transactions/cancels", api_version, params)
      Response.new(response_request, self).serialize
    end

    def errors
      @errors ||= Errors.new
    end

    def update_attributes(attrs)
      attrs.each { |name, value| send("#{name}=", value) }
    end

    private
    def api_version
      "v2"
    end

    def params
      RequestSerializer.new(self).to_params
    end
  end
end
