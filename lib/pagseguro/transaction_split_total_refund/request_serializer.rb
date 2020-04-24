module PagSeguro
  class TransactionSplitTotalRefund
    class RequestSerializer
      # The transaction_split_total_refund that will be serialized.
      attr_reader :transaction_split_total_refund

      def initialize(transaction_split_total_refund)
        @transaction_split_total_refund = transaction_split_total_refund
      end

      def to_params
        {}.tap do |data|
          data[:transactionCode] = transaction_split_total_refund.transaction_code
        end.delete_if { |_, value| value.nil? }
      end
    end
  end
end
