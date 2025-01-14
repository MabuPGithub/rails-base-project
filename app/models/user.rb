class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    approved? ? super : :not_approved
  end

  has_many :my_stocks
  has_many :transaction_tables
end
