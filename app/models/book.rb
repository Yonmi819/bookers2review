class Book < ApplicationRecord
#モデルの関連付け  
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
#バリデーション
  validates :title, presence: true
  validates :body,  presence: true, length: { maximum: 200 }
  
#いいねしたユーザーがいないか判断するメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
