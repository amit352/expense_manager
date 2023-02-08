class TransactionParty < ApplicationRecord
  before_create :set_account

  def set_account
    self.account = [nominee, branch].compact.join("-")
  end

  def credit(amount)
    self.balance += amount
    save
  end

  def debit(amount)
    self.balance -= amount
    save
  end
end
