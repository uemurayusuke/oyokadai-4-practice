class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end

#followerというのは、userテーブルに存在するイメージ
#followedというのも、userテーブルに存在するイメージ
#userテーブルに存在するから、class_nameでuserを指定する必要がある。
