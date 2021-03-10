class BuyHistoryAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :address, :building_name, :phone_number, :user_id, :item_id

  # ここにバリデーションの処理を書く

  with_options presence: true do
    validates :user, foreign_key: true
    validates :item, foreign_key: true
    validates :post_code
    validates :city
    validates :address
    validates :phone_number
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  #building_nameはバリデーションなし

  def save
    # 各テーブルにデータを保存する処理を書く
    # 寄付情報を保存し、変数donationに代入する
    buy_history = BuyHistory.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_history_id: buy_history.id)
  end
end
