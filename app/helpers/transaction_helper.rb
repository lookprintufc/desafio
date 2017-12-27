module TransactionHelper
  #MODAL
  def infos_transfer(transaction)
    if transaction.transaction_type == "transfer_in"
      "Dinheiro recebido da conta #{transaction.destination_account_bank.number_account}, agência #{transaction.destination_account_bank.agency_bank.number_agency}"
    elsif transaction.transaction_type == "transfer_out"
      "Dinheiro enviado para a conta #{transaction.destination_account_bank.number_account}, agência #{transaction.destination_account_bank.agency_bank.number_agency}"
    end
  end

  def cash_back_button(transaction)
    if ["deposit", "transfer_out"].include? transaction.transaction_type
      if transaction.cash_out
        "ESTORNADO"
      else
        link_to cash_back_path(transaction), class: 'icon', method: :patch, data: { confirm: "Deseja realmente estonar #{number_to_currency(transaction.price)}?" } do
          content_tag(:i, "", class: "s7-trash") + "Estornar"
        end
      end
    end
  end

  def transaction_type_view(transaction)
    if ["transfer_in", "transfer_out"].include? transaction.transaction_type
      link_to "", data: { confirm: "#{infos_transfer(transaction)}" } do
        Transaction.human_enum_name(:transaction_types, transaction.transaction_type)
      end
    else
      transaction.transaction_type
    end
  end
end
