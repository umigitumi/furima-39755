class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :encrypted_password, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :name_first, presence: true
  validates :name_last, presence: true
  validates :name_first_kana, presence: true
  validates :name_last_kana, presence: true
  validates :birthday, presence: true

  #with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    #validates :name_first
    #validates :name_last
    #validates :name_first_kana
    #validates :name_last_kana
  #end

  #PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  #validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

end