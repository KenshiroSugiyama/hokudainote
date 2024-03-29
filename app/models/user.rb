class User < ApplicationRecord
  has_many :notes,dependent: :destroy
  has_one :user_profile,dependent: :delete,foreign_key: :user_id
  has_many :my_notes, foreign_key: 'buyer_id',dependent: :destroy
  has_many :notes,through: :my_notes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[google_oauth2]
  #validate :check_email
  has_many :cards,dependent: :destroy,foreign_key: :user_id
  has_one :bank_account,dependent: :delete,foreign_key: :user_id
 # validates :accepted, presence: {message: 'を入力してください'}
  

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

  protected
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
  
end
