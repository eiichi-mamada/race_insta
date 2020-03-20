8.times do |i|
  Area.create!(
    id: "#{i+1}",
    name: "area#{i+1}"
  )
end

Car.create!(
  [
    {
      id: 1,
      car_number:3,
      name:"CRAFTSPORTS MOTUL GT-R"
    },
    {
      id: 2,
      car_number:8,
      name:"ARTA NSX-GT"
    },
    {
      id: 3,
      car_number:12,
      name:"CALSONIC IMPUL GT-R"
    },
    {
      id: 4,
      car_number:14,
      name:"WAKO'S 4CR GR Supra"
    },
    {
      id: 5,
      car_number:16,
      name:"MOTUL MUGEN NSX-GT"
    },
    {
      id: 6,
      car_number:17,
      name:"KEIHIN NSX-GT"
    },
    {
      id: 7,
      car_number:19,
      name:"WedsSport ADVAN GR Supra"
    },
    {
      id: 8,
      car_number:23,
      name:"MOTUL AUTHECH GT-R"
    },
    {
      id: 9,
      car_number:24,
      name:"REALIZE ADVAN GT-R"
    },
    {
      id: 10,
      car_number:36,
      name:"au TOM'S GR Supra"
    },
    {
      id: 11,
      car_number:37,
      name:"KeePer TOM's GR Supra"
    },
    {
      id: 12,
      car_number:38,
      name:"ZENT CERUMO GR Supra"
    },
    {
      id: 13,
      car_number:39,
      name:"DENSO KOBELCO SARD GR Supra"
    },
    {
      id: 14,
      car_number:64,
      name:"Modulo Epson NSX-GT"
    },
    {
      id: 15,
      car_number:100,
      name:"RAYBRIG NSX-GT"
    },
  ]
)