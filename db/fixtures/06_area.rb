areas = [
  { name: '銀座', latitude: 35.671612, longitude: 139.765456, southeast_direction: false, south_direction: false, southwest_direction: false },
  { name: '日比谷', latitude: 35.674303, longitude: 139.760520, north_direction: false, south_direction: false, southwest_direction: false, west_direction: false, northwest_direction: false},
  { name: '東京駅（八重洲エリア）', latitude: 35.681206, longitude: 139.768970 },
  { name: '東京駅（丸の内エリア）', latitude: 35.681546, longitude: 139.765387 },
  { name: '新橋', latitude: 35.666512, longitude: 139.758209 },
  { name: '浜松町', latitude: 35.655289 , longitude: 139.757076 },
  { name: '品川', latitude: 35.629019, longitude: 139.739489 },
  { name: '人形町', latitude: 35.685871, longitude: 139.782665 },
  { name: '門前仲町', latitude: 35.671965, longitude: 139.795849 },
  { name: '日本橋', latitude: 35.682900, longitude: 139.772815 },
  { name: '六本木', latitude: 35.662752, longitude: 139.731173 },
  { name: '麻布', latitude: 35.659586, longitude: 139.723700},
  { name: '赤坂見附', latitude: 35.676461, longitude: 139.736885 },
  { name: '表参道', latitude: 35.665181, longitude: 139.712731},
  { name: '渋谷', latitude: 35.658730, longitude: 139.701540 },
  { name: '恵比寿', latitude: 35.646002, longitude: 139.710585},
  { name: '代官山', latitude: 35.648225, longitude: 139.702645},
  { name: '中目黒', latitude: 35.643683, longitude: 139.698847},
  { name: '新宿西口', latitude: 35.690106, longitude: 139.697689},
  { name: '新宿東口〜新宿三丁目', latitude: 35.690795, longitude: 139.704641 },
  { name: '高田馬場', latitude: 35.713569, longitude: 139.704105 },  
  { name: '池袋', latitude: 35.728891, longitude: 139.709705},
  { name: '飯田橋', latitude: 35.702008, longitude: 139.745089 },
  { name: '神保町', latitude: 35.695988, longitude: 139.758071 },
  { name: '神田', latitude: 35.691840, longitude: 139.770838 }
]

areas.each do |area_params|
  Area.create(area_params)
end
