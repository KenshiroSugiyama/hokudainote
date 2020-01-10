class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validate :check_email

  def check_email
    if email !~ /^@eis.hokudai.ac.jp/
      errors.add(:email, " は学校のアドレスを使ってください") 
    end
  end
end
