class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end

#ここでは、userの中でフォローされる人とフォローする人が存在し、多対多の関係になる。
#なので、relationshipテーブルを用意する。これは中間テーブルです。
#本来の書き方としては、belongs_to :userとする。
#しかし、userの中で区別をしないといけないから、followerとfollowedと名義する。しかし参照するのは、userモデルから参照しますよって話。
