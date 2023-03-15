class Post < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :category }
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  
    validate :title_uniqueness_within_category
    validate :sufficiently_clickbait_y_title

    private
  
    def title_uniqueness_within_category
      if Post.where(category: category, title: title).exists?
        errors.add(:title, "must be unique within the same category")
      end
    end

    def sufficiently_clickbait_y_title
        if title.present? && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
          errors.add(:title, "must be sufficiently clickbait-y")
        end
    end
end
  
  
  
  
  
  