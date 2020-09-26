class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'テーブル' },
    { id: 2, name: 'チェア' },
    { id: 3, name: 'ライト・ランタン' },
    { id: 4, name: 'テント・タープ' },
    { id: 5, name: 'グリル' },
    { id: 6, name: 'その他' }
  ]
end
