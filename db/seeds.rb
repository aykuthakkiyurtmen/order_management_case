r1 = Role.create({ name: 'Regular', description: 'Can read items' })
r2 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

u1 = User.create({ name: 'Sally', email: 'sally@example.com', password: '123456', password_confirmation: '123456', role_id: r1.id })
u2 = User.create({ name: 'Sue', email: 'sue@example.com', password: '123456', password_confirmation: '123456', role_id: r2.id })
u3 = User.create({ name: 'Kev', email: 'kev@example.com', password: '123456', password_confirmation: '123456', role_id: r2.id })
