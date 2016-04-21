tags = [
  { name: 'クラフトビール初心者' },
  { name: 'コンビニ限定' },
  { name: 'ベルギービール' },  
  { name: 'クラフトビール' },
  { name: 'ペールエール' },
  { name: 'Pale Ale' },
  { name: 'IPA' },
  { name: 'インディアペールエール' },
  { name: 'マニア向け' },
  { name: 'エール' },
  { name: 'ラガー' }
]
tags.each do |tag_params|
  Tag.create(tag_params)
end
