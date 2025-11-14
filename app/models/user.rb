class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネームが必須
  validates :nickname, presence: true

  # お名前（全角）必須＋全角（漢字・ひらがな・カタカナ）制限
  with_options presence: true,
               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :last_name
    validates :first_name
  end

  # お名前カナ（全角カタカナ）必須＋全角カタカナ制限
  with_options presence: true,
               format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  # 生年月日が必須
  validates :birthday, presence: true

  # パスワード（Devise標準の6文字以上に加えて英数字混合チェック）
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                                 message: 'is invalid. Include both letters and numbers' }
end
