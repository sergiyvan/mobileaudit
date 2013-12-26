class RegisterOperators < ActiveRecord::Migration
  def self.up
    User.create(email: 'oper1@checklines.pro', role: "operator", password: '123qwe123', password_confirmation: '123qwe123')
    User.create(email: 'oper2@checklines.pro', role: "operator", password: '123qwe123', password_confirmation: '123qwe123')
    User.create(email: 'oper3@checklines.pro', role: "operator", password: '123qwe123', password_confirmation: '123qwe123')
  end
  def self.down
    User.find_by_email('oper1@checklines.pro').delete
    User.find_by_email('oper2@checklines.pro').delete
    User.find_by_email('oper3@checklines.pro').delete
  end
end
