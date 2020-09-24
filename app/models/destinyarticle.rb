class Destinyarticle < ApplicationRecord
    
validates :title, presence: true    
has_one_attached :articleimage    
belongs_to :user    
has_many :records, dependent: :destroy
has_many :destinyarticle_tags, dependent: :destroy
has_many :tags, through: :destinyarticle_tags, dependent: :destroy
has_many :likes, dependent: :destroy
end
