class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品' },
    { id: 3, name: 'ほぼ新品' },
    { id: 4, name: '目立った汚れ・傷なし' },
    { id: 5, name: '汚れ・傷あり' },
    { id: 6, name: '故障' }
  ]

  include ActiveHash::Associations
  has_many :items
end
