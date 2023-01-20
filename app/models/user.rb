class User < ApplicationRecord
    require "mini_magick"

	validates_uniqueness_of :username
    scope :all_except, ->(user) { where.not(id: user) }
    after_create_commit { broadcast_append_to "users" }
    has_many :messages
    has_one_attached:image

    after_commit :add_default_image, on: %i[create update]

    def image_thumbnail
            image.variant(resize_to_limit: [150, 150]).processed
        # end
    end

    def chat_image
        # byebug
        # if image.attached? 
            image.variant(resize_to_limit: [50, 50]).processed
        # end
    end
    private
    
    # def add_default_image
    #     return if image.attached?

    #     image.attached?(
    #     io: File.open(Rails.root.join('app', 'assets', 'images', 'default_image.jpeg')),
    #     filename: 'default_image.jpeg',
    #     content_type: 'image/jpeg'
    #         )
    # end

    def add_default_image
        return if image.attached?

        image.attach(
          io: File.open(Rails.root.join('app', 'assets', 'images', 'default_image.jpeg')),
          filename: 'default_image.jpeg',
          content_type: 'image/jpeg'
        )
    end
end
