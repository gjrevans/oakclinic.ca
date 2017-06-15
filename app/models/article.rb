class Article < ApplicationRecord
    #extend FriendlyId
    #friendly_id :title, use: :slugged
    enum status: { unpublished: 0, preview: 1, published: 2 }
end
