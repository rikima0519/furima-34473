class BuyHistoryAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    #validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)が必要です'} #日本語ver
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }, numericality: { only_integer: true }
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  # building_nameはバリデーションなし

  def save
    # 各テーブルにデータを保存する処理を書く
    buy_history = BuyHistory.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_history_id: buy_history.id)
  end
end
