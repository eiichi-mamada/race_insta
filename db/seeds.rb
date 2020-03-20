8.times do |i|
  Area.create!(
    id: "#{i+1}",
    name: "area#{i+1}"
  )
end

Car.create!(
  [
    {
    car_number:3,
    name:"CRAFTSPORTS MOTUL GT-R"
    },
    {
      car_number:8,
      name:"ARTA NSX-GT"
    },
    {
      car_number:12,
      name:"CALSONIC IMPUL GT-R"
    },
    {
      car_number:14,
      name:"WAKO'S 4CR GR Supra"
    },
    {
      car_number:16,
      name:"MOTUL MUGEN NSX-GT"
    },
    {
      car_number:17,
      name:"KEIHIN NSX-GT"
    },
    {
      car_number:19,
      name:"WedsSport ADVAN GR Supra"
    },
    {
      car_number:23,
      name:"MOTUL AUTHECH GT-R"
    },
    {
      car_number:24,
      name:"REALIZE ADVAN GT-R"
    },
    {
      car_number:36,
      name:"au TOM'S GR Supra"
    },
    {
      car_number:37,
      name:"KeePer TOM's GR Supra"
    },
    {
      car_number:38,
      name:"ZENT CERUMO GR Supra"
    },
    {
      car_number:39,
      name:"DENSO KOBELCO SARD GR Supra"
    },
    {
      car_number:64,
      name:"Modulo Epson NSX-GT"
    },
    {
      car_number:100,
      name:"RAYBRIG NSX-GT"
    },
  ]
)