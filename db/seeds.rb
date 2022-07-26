r1 = Role.create({ name: 'Regular', description: 'Can read items' })
r2 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

u1 = User.create!({ name: 'Yukihiro Matsumoto', email: 'yukihiro_matsumoto@example.com', password: '12345678', password_confirmation: '12345678', role_id: r1.id })
u2 = User.create!({ name: 'John', email: 'john@nash.com', password: '123456', password_confirmation: '123456', role_id: r2.id })
u3 = User.create!({ name: 'Aykut', email: 'aykut@yurtmen.com', password: '123456', password_confirmation: '123456', role_id: r2.id })


s1 = Store.create({name: "nike", user_id: u2.id})
s2 = Store.create({name: "koton", user_id: u2.id})

p1 = Product.create!({name: "pantolon", description: "kot pantolon", price: 400, store_id: s1.id, user_id: u2.id})
p2 = Product.create({name: "gomlek", description: "pamuklu", price: 1000, store_id: s2.id, user_id: u2.id})


s3 = Store.create({name: "stradivarius", user_id: u3.id})
s4 = Store.create({name: "zara", user_id: u3.id})

p3 = Product.create({name: "elbise", description: "pileli", price: 1000, store_id: s3.id, user_id: u3.id})
p4 = Product.create({name: "takim elbise", description: "italyan ipegi", price: 6500, store_id: s4.id, user_id: u3.id})