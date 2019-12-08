class User < ApplicationRecord
  validates_presence_of :first_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
         
  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    if (confirmed_at.nil?)
      :unconfirmed
    else 
      approved? ? super : :not_approved  
    end  
  end
end
