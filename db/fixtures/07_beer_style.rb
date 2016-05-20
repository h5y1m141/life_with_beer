beer_styles = [
  { name: 'ピルスナー', full_bodied_ratio: 2, bitter_taste_ratio: 5,  aroma_ratio: 2 },
  { name: '白ビール', full_bodied_ratio: 1, bitter_taste_ratio: 1,  aroma_ratio: 6 },
  { name: 'セゾン', full_bodied_ratio: 2, bitter_taste_ratio: 4,  aroma_ratio: 6 },
  { name: 'ペールエール', full_bodied_ratio: 5, bitter_taste_ratio: 5,  aroma_ratio: 5 },
  { name: 'アンバーエール', full_bodied_ratio: 6, bitter_taste_ratio: 3,  aroma_ratio: 6 },
  { name: 'インディアペールエール', full_bodied_ratio: 9, bitter_taste_ratio: 0,  aroma_ratio: 9 },
  { name: 'ポーター', full_bodied_ratio: 8, bitter_taste_ratio: 3,  aroma_ratio: 8 },
  { name: 'スタウト', full_bodied_ratio: 6, bitter_taste_ratio: 2,  aroma_ratio: 6 },
  { name: 'バーレーワイン', full_bodied_ratio: 10, bitter_taste_ratio: 10,  aroma_ratio: 10 },
  { name: 'フルーツビール', full_bodied_ratio: 4, bitter_taste_ratio: 1,  aroma_ratio: 7 }
]

beer_styles.each{ |beer_style_params| BeerStyle.create(beer_style_params)}
