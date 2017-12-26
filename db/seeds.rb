# USUÁRIO
User.create(email: 'admin@admin.com', password: '123456@@')

# Transaction.create(account_bank_id: 1, price: 200, transaction_type: :deposit, user_id: 1)
# Transaction.create(account_bank_id: 1, price: 300, transaction_type: :withdrawal, user_id: 1)
# Transaction.create(account_bank_id: 1, price: 300, transaction_type: :withdrawal, user_id: 1)

Transaction.create(account_bank_id: 1, price: 200, transaction_type: :cash_back_out, user_id: 1)








