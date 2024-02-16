class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end

#ここでは、userの中でフォローされる人とフォローする人が存在し、多対多の関係になる。
#なので、relationshipテーブルを用意する。これは中間テーブルです。
