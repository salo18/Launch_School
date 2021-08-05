PRODUCTS = [
  {name: "Thinkpad x210", price: 220},
  {name: "Thinkpad x220", price: 250},
  {name: "Thinkpad x250", price: 300},
  {name: "Thinkpad x250", price: 500},
  {name: "Dell x210", price: 250},
  {name: "Dell x210", price: 400},
  {name: "Dell x530", price: 500},
  {name: "Dell x710", price: 700},
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: "dell"
}

def search(hsh)
  make = hsh[:q].capitalize
  min = hsh[:price_min]
  max = hsh[:price_max]

  new_arr =  PRODUCTS.select do |arr|
                arr[:name].start_with?(make) && (arr[:price] > min && arr[:price] < max)
              end


  p new_arr

end


search(query)
# [ {name: "Thinkpad x220", price: 250} ]

search(query2)
# [ {name: "Dell x210", price: 400} ]