class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :post_num,        null: false, default: ""
      t.integer    :prefecture_id,   null: false
      t.string     :city,            null: false, default: ""
      t.string     :address,         null: false, default: ""
      t.string     :building,        null: false, default: ""
      t.string     :phone_num,       null: false, default: ""
      t.references :buy_item,        foreign_key: true
      t.timestamps
    end
  end
end
