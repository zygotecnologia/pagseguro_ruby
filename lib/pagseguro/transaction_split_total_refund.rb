module PagSeguro
  class TransactionSplitTotalRefund
    include Extensions::Assignment

    attr_accessor :transaction_code
    attr_accessor :result

    def register
      response_request = Request.post(url_total_refund, nil, {}, headers)
      Response.new(response_request, self).serialize
    end

    def errors
      @errors ||= Errors.new
    end

    def update_attributes(attrs)
      attrs.each { |name, value| send("#{name}=", value) }
    end

    private
    def url_total_refund
      "transactions/#{transaction_code}/totalRefund/splitpayment"
    end

    def params
      RequestSerializer.new(self).to_params
    end

    def headers
      { 'Accept': 'application/vnd.pagseguro.com.br.v3+xml' }
    end
  end
end
