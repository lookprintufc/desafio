class TransactionDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :number_to_currency, :cash_back_button, :transaction_type_view

  def view_columns
    @view_columns ||= {
      created_at: { source: "Transaction.created_at" },
      transaction_type: { source: "Transaction.transaction_type" },
      price: { source: "Transaction.price"},
      user: { source: "Transaction.user_id"},
      cash_back: {source: "Transaction.id", searchable: false, orderable: false},
    }
  end

  def data
    records.map do |record|
      {
        created_at: record.created_at,
        transaction_type: transaction_type_view(record),
        price: number_to_currency(record.price),
        user: record.user.name,
        cash_back: cash_back_button(record),
      }
    end
  end

  private

  def get_raw_records
    options[:query]
  end


end
