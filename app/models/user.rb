class User < ApplicationRecord
  has_many :notes
  has_one :user_profile
  has_many :my_notes
  has_many :notes,through: :my_notes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  #validate :check_email
  has_many :cards
  has_one :bank_account

  

  def check_email
    if email !~ /^@eis.hokudai.ac.jp/
      errors.add(:email, " は学校のアドレスを使ってください") 
    end
  end
 
  def buy(note) 
    unless self.id == note.exhibitor_id
      note.my_notes.find_or_create_by(note_id: note.id,buyer_id: self.id)
    end
  end

  
end
