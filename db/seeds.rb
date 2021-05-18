# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
    {
        email: 'admin@example.com',
        password: 'admin@1234',
        role: 1,
        confirmed_at: DateTime.now
    },
    {
        email: 'customer1@example.com',
        password: 'customer@1234',
        confirmed_at: DateTime.now
    },
    {
        email: 'customer2@example.com',
        password: 'customer@1234',
    },
])

regions = Region.create([
    {
        title: 'Bangkok',
        country: 'Thailand',
        currency: "Baht",
        tax: '7'
    },
    {
        title: 'Pattaya',
        country: 'Thailand',
        currency: "Baht",
        tax: '8'
    },
    {
        title: 'Yangon',
        country: 'Myanmar',
        currency: "Kyats",
        tax: '5'
    }
])

products = Product.create([
    {
        title: 'iPhone',
        description: 'Apple',
        image: Rails.root.join("public/images/iphone.jpg").open,
        price: 20000,
        sku: 'iphone-xs-bkk',
        stock: 10,
        region: Region.where(title: "Bangkok").first
    },
    {
        title: 'keyboard',
        description: 'Black',
        image: Rails.root.join("public/images/keyboard.jpg").open,
        price: 1000,
        sku: 'keyboard-black-bkk',
        stock: 15,
        region: Region.where(title: "Bangkok").first
    },
    {
        title: 'T-shirt',
        description: 'size-s',
        image: Rails.root.join("public/images/shirt.jpg").open,
        price: 500,
        sku: 't-shirt-s-pyx',
        stock: 15,
        region: Region.where(title: "Pattaya").first
    },
    {
        title: 'shoe',
        description: 'Blue',
        image: Rails.root.join("public/images/shoe.jpg").open,
        price: 1500,
        sku: 'shoe-blue-pyx',
        stock: 17,
        region: Region.where(title: "Pattaya").first
    },
    {
        title: 'wallet',
        description: 'Black',
        image: Rails.root.join("public/images/wallet.jpg").open,
        price: 50000,
        sku: 'wallet-black-ygn',
        stock: 17,
        region: Region.where(title: "Yangon").first
    },
    {
        title: 'watch',
        description: 'smart-watch',
        image: Rails.root.join("public/images/watch.jpg").open,
        price: 350000,
        sku: 'iphone-xs-ygn',
        stock: 18,
        region: Region.where(title: "Yangon").first
    },

])

orders = Order.create([
    {
        name: 'Aung',
        address: 'Kamayut, Yangon',
        phone: '+95979984854',
        summary: 'frangile',
        user: User.find(1)
    }, 
    {
        name: 'Kyaw',
        address: 'Bangkok, Thailand',
        phone: '+66958982559',
        summary: 'frangile',
        user: User.find(2)
    }
])

order1= orders.first
order1.product_orders.create([
    {
        quantity: 2,
        product: Product.where(title: "wallet").first
    },
    {
        quantity: 5,
        product: Product.where(title: "watch").first
    },
])

order2= orders.last
order2.product_orders.create([
    {
        quantity: 1,
        product: Product.where(title: "iPhone").first
    },
    {
        quantity: 2,
        product: Product.where(title: "keyboard").first
    },
])
