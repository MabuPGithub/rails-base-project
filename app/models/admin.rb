class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def build_user(user_attr)
    @user = User.new(user_attr)
    @user.password = "123456"
    @user.approved = true
    @user
  end
end
