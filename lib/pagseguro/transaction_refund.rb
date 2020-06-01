module PagSeguro
  class TransactionRefund
    include Extensions::MassAssignment
    include Extensions::Credentiable

    # Set the transaction code.
    # The transaction status must be: Paga (3), Disponível (4), Em disputa (5)
    attr_accessor :transaction_code

    # Set the refund value.
    # Greater than 0.00 and less or equal than transaction value.
    # If not informed, PagSeguro will assume the total transaction value.
    attr_accessor :value

    attr_accessor :result
    attr_reader :errors

    def register
      response_request = Request.post("transactions/refunds", api_version, params, headers, credentials)
      Response.new(response_request, self).serialize
    end

    def errors
      @errors ||= Errors.new
    end

    def update_attributes(attrs)
      attrs.map { |name, value| send("#{name}=", value) }
    end

    private
    def api_version
      "v2"
    end

    def params
      RequestSerializer.new(self).to_params
    end

    def headers
      {}
    end
  end
end
