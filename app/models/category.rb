class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: 'アイスクリーム'},
    {id: 3, name: 'おみやげ'},
    {id: 4, name: '唐揚げ'},
    {id: 5, name: '喫茶店'},
    {id: 6, name: '餃子'},
    {id: 7, name: 'コーヒー'},
    {id: 8, name: 'スイーツ'},
    {id: 9, name: 'たこ焼き'},
    {id: 10, name: 'チーズケーキ'},
    {id: 11, name: '定食屋'},
    {id: 12, name: 'パスタ/ピザ'},
    {id: 13, name: 'パン'},
    {id: 14, name: 'パンケーキ'},
    {id: 15, name: 'ハンバーガー'},
    {id: 16, name: '焼肉'},
    {id: 17, name: 'ラーメン'},
    {id: 18, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :cards
end