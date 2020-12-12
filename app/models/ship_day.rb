class ShipDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '当日' },
    { id: 3, name: '1〜2日' },
    { id: 4, name: '3〜4日' },
    { id: 5, name: '5日〜6日' },
    { id: 6, name: '7日以上' }
  ]

  include ActiveHash::Associations
  has_many :items
end
