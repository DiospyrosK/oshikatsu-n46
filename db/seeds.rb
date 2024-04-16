location,restaurant,fashion,sonota1 = Category.create([{name: "ロケ地"}, {name: "飲食店"},{name: "ファッション"},{name: "その他"}])

#ロケ地
["北海道","青森県","秋田県","岩手県","宮城県","福島県","山形県","茨城県","群馬県","栃木県","埼玉県","東京都","千葉県","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"].each do |name|

  location.children.create(name: name)

end

#飲食店
hokkaido,aomori,akita,iwate,miyagi,fukusshima,yamagata,ibaraki,gunma,tochigi,saitama,tokyo,chiba,kanagawa,nigata,toyama,ishikawa,fukui,yamanashi,nagano,gifu,shizuoka,aichi,mie,shiga,kyoto,osaka,hyogo,nara,wakayama,tottori,shimane,okayama,hiroshima,yamaguchi,tokushima,kagawa,ehime,kochi,fukuoka,saga,nagasaki,kumamoto,oita,miyazaki,kagashima,okinawa = restaurant.children.create([{name: "---"},{name: "北海道"},{name: "青森県"},{name: "秋田県"},{name: "岩手県"},{name: "宮城県"},{name: "福島県"},{name: "山形県"},{name: "茨城県"},{name: "群馬県"},{name: "栃木県"},{name: "埼玉県"},{name: "東京都"},{name: "千葉県"},{name: "神奈川県"},{name: "新潟県"},{name: "富山県"},{name: "石川県"},{name: "福井県"},{name: "山梨県"},{name: "長野県"},{name: "岐阜県"},{name: "静岡県"},{name: "愛知県"},{name: "三重県"},{name: "滋賀県"},{name: "京都府"},{name: "大阪府"},{name: "兵庫県"},{name: "奈良県"},{name: "和歌山県"},{name: "鳥取県"},{name: "島根県"},{name: "岡山県"},{name: "広島県"},{name: "山口県"},{name: "徳島県"},{name: "香川県"},{name: "愛媛県"},{name: "高知県"},{name: "福岡県"},{name: "佐賀県"},{name: "長崎県"},{name: "熊本県"},{name: "大分県"},{name: "宮崎県"},{name: "鹿児島県"},{name: "沖縄県"}])
prefecture = [hokkaido,aomori,akita,iwate,miyagi,fukusshima,yamagata,ibaraki,gunma,tochigi,saitama,tokyo,chiba,kanagawa,nigata,toyama,ishikawa,fukui,yamanashi,nagano,gifu,shizuoka,aichi,mie,shiga,kyoto,osaka,hyogo,nara,wakayama,tottori,shimane,okayama,hiroshima,yamaguchi,tokushima,kagawa,ehime,kochi,fukuoka,saga,nagasaki,kumamoto,oita,miyazaki,kagashima,okinawa]

["肉","海鮮","パン","麺","お菓子","フルーツ","その他"].each do |name|
  prefecture.each do |prefecture|
    prefecture.children.create(name: name)
  end
end

#ファッション
tops,jaket_outer,pants,skart,wanpice,shoo,roomwea,hat,bag,acesary,tokei,sonota = fashion.children.create([{name: "トップス"},{name: "ジャケット/アウター"},{name: "パンツ"},{name: "スカート"},{name: "ワンピース"},{name: "靴"},{name: "ルームウェア/パジャマ"},{name: "帽子"},{name: "バッグ"},{name: "アクセサリー"},{name: "時計"},{name: "その他"}])


#管理者権限
User.create!(
  nickname: "管理者",
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD'],
  admin: true
)