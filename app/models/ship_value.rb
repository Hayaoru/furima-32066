class ShipValue < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '出品者' },
    { id: 3, name: '落札者' },
    { id: 4, name: '未定' }
  ]

  include ActiveHash::Associations
  has_many :items
end
