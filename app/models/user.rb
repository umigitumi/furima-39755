class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  #validates :encrypted_password, presence: true, format: { with: /\A[a-z0-9]+\z/i } #空でない、半角英数字混合でない
  validates :encrypted_password, presence: true
  validates :name_first, presence: true
  validates :name_last, presence: true
  validates :name_first_kana, presence: true
  validates :name_last_kana, presence: true
  validates :birthday, presence: true

  has_many :items
  has_many :purchases

end