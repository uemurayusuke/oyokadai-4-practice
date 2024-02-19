class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end

#解説
#今は流れだけ理解できればいいとの事。完全な理解は無くてもいい。
#userモデルを参照して、followerという名前で定義している。
#userモデルを参照して、followedという名前で定義している。