class Account < ActiveRecord::Base
  has_many :movements
  
  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :opening_balance, :numericality => true, :presence => true
end
