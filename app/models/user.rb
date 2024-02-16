class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy






  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  #reverse_of_relationshipsは名義した物。実際の内容は、relationshipテーブルのfollowed_idを複数持ってるという意味。
  #followesも名義した物、reverse_of_relationshipsを通じて、followerカラムを指定します。
  #このfollowerカラムはrelationshipで定義したfollowerを意味します。
  #何となく理解はできているけど、100%の理解ではないなって感じやな。
  #キータとかZenの説明を読んでみたけど、100％理解しきれていない。
  #2行目が必要な理由が説明できひんな。
  #この2つのコードは1セットで、2行目を削除すると、成り立たない。
  #1行目はあくまで関連付けの定義でしかない。
  #1行目を2行目で使用するって感じみたいやな。
  #メンターに聞いていみないと分からんな。




  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed







  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def follow(user)
    relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
