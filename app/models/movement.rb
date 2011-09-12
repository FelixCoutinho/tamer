# encoding: UTF-8
class Movement < ActiveRecord::Base

  FLOWS = ['Entrada', 'Saída']
  
  belongs_to :account
  validates_associated :account
  validates_inclusion_of :flow, :in => FLOWS
  
  validates :account, :flow, :value, :date, :presence => true
  validates :value, :numericality => {:greater_than => 0.00}, :if => "value.nil?"
  
end
