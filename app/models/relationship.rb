class Relationship < ApplicationRecord
#モデルの関連付け class_name:でUserモデルを参照"
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
