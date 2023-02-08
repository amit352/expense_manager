class Transaction < ApplicationRecord
  enum type: { income: 0, expense: 1, transfer: 2 }

  belongs_to :category
  belongs_to :sub_category
  belongs_to :transaction_mode
  belongs_to :issuer, class_name: TransactionParty.name
  belongs_to :beneficiary, class_name: TransactionParty.name

  after_save :update_accounts

  def update_accounts
    ActiveRecord::Base.transaction do
      issuer.debit(amount) if %i[expense transfer].include?(type)
      beneficiary.credit(amount)
    end
  end
end
