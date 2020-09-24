class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  has_many :destinyarticles       
  has_one_attached :profileimage
has_many :records, dependent: :destroy
has_many :likes, dependent: :destroy

end
