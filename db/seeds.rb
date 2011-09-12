# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
accounts = Account.create([
  {
    :name => 'Conta Corrente', 
    :opening_balance => 12454.45
  },
  {
    :name => 'Poupança Caixa', 
    :opening_balance => 35482.12
  },
  {
    :name => 'Vale Alimentação', 
    :opening_balance => 450.85
      
  },
  {
    :name => 'Cartão de Crédito', 
    :opening_balance => 8798.54
  },
  {
    :name => 'Conta Salário', 
    :opening_balance => 0.0    
  }
])
Movement.create([
  {
    :flow => 'Saída',
    :date => '03/18/2011',
    :value => 45.85,
    :observation => 'Almoço com a família.',
    :account => accounts.first
  },
  {
    :flow => 'Entrada',
    :date => '03/15/2011',
    :value => 5897.45,
    :observation => 'Salário.',
    :account => accounts.fifth
  },
  {
    :flow => 'Saída',
    :date => '03/02/2011',
    :value => 18.87,
    :observation => 'Almoço.',
    :account => accounts.second
  },
  {
    :flow => 'Entrada',
    :date => '07/01/2011',
    :value => 450.78,
    :observation => 'Pagamento de empréstimo.',
    :account => accounts.first
  },
  {
    :flow => 'Saída',
    :date => '06/25/2011',
    :value => 87.26,
    :observation => 'Almoço com a família no domingo.',
    :account => accounts.fourth
  }
])
