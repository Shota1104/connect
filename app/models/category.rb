class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '音楽' },
    { id: 3, name: '美容' },
    { id: 4, name: '料理' },
    { id: 5, name: '教育' },
    { id: 6, name: 'ビジネス' },
    { id: 7, name: 'イベント' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'インテリア' },
    { id: 10, name: 'ゲーム' },
    { id: 11, name: 'その他' }
  ]
  end