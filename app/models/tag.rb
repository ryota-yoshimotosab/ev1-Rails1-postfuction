class Tag < ApplicationRecord
    has_many :destinyarticle_tags, dependent: :destroy
        has_many :destinyarticles, through: :destinyarticle_tags, dependent: :destroy
end
