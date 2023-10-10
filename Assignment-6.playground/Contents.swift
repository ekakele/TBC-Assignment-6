//Lecture 8 - Class & Inheritance

task(for: 1, exercise: "ბიბლიოთეკის სიმულაცია") {
    
    //  1.1. შევქმნათ Class Book.  Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.  Designated Init. Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს. Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.
    
    class Book {
        let bookID: Int
        let title: String
        let author: String
        var isBorrowed: Bool
        
        //by default isBorrowed property = false
        init(bookID: Int, title: String, author: String, isBorrowed: Bool = false) {
            self.bookID = bookID
            self.title = title
            self.author = author
            self.isBorrowed = isBorrowed
        }
        
        func markAsBorrowed() {
            isBorrowed = true
        }
        
        func markAsReturned() {
            isBorrowed = false
        }
    }
    
    //  1.2. შევქმნათ Class Owner  Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.  Designated Init. Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან. Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.
    
    class Owner {
        let ownerID: Int
        var name: String
        var borrowedBooks: [Book]
        
        //by default borrowedBooks = empty array
        init(ownerID: Int, name: String, borrowedBooks: [Book] = []) {
            self.ownerID = ownerID
            self.name = name
            self.borrowedBooks = borrowedBooks
        }
        
        func borrowBook(book: Book) {
            borrowedBooks.append(book)
            book.markAsBorrowed()
        }
        
        func returnBook(book: Book) {
            if let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) {
                borrowedBooks.remove(at: index)
                book.markAsReturned()
            }
        }
    }
    
    //  1.3. შევქმნათ Class Library  Properties: Books Array, Owners Array.  Designated Init.  Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით. Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს. Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს. Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს. Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ. Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.
    
    class Library {
        var books: [Book]
        var owners: [Owner]
        
        //by default owners and books properties = empty array
        init(books: [Book] = [], owners: [Owner] = []){
            self.books = books
            self.owners = owners
        }
        
        func addBooks(booksToAdd: [Book]) {
            self.books += booksToAdd// using the self property to refer to the current instance (Library) within its own instance method
        }
        
        func addOwners(ownersToAdd: [Owner]) {
            self.owners += ownersToAdd
        }
        
        func booksAvailable() -> [Book] {
            books.filter { !$0.isBorrowed } //false
        }
        
        func booksBorrowed() -> [Book] {
            books.filter { $0.isBorrowed } //true
        }
        
        func searchForOwner(ownerIDToSearch: Int) -> Owner? {
            owners.first { $0.ownerID == ownerIDToSearch } 
        }
        
        func booksBorrowedByOwner(owner: Owner) -> [Book] {
            return owner.borrowedBooks
        }
        
        func borrowAvailableBooks(owner: Owner, books: [Book]) {
            for book in books {
                if !book.isBorrowed {
                    owner.borrowBook(book: book)
                }
            }
        }
        
        
    }
    
    //  1.4. გავაკეთოთ ბიბლიოთეკის სიმულაცია. შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა. დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი. დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.
    
    let book789 = Book(bookID: 789, title: "Jane Eyre", author: "Charlotte Bronte")
    let book548 = Book(bookID: 548, title: "Wuthering Heights", author: "Emily Bronte")
    let book631 = Book(bookID: 631, title: "The Tenant of Wildfell Hall", author: "Anne Bronte")
    let book465 = Book(bookID: 465, title: "Peter and Wendy", author: "James Matthew Barrie")
    let book549 = Book(bookID: 465, title: "Pippi Longstocking", author: "Astrid Lindgren")
    
    
    let user1134 = Owner(ownerID: 1134, name: "David Hops")
    let user2756 = Owner(ownerID: 2756, name: "Samantha Clarcks")
    let user4758 = Owner(ownerID: 4758, name: "Elle Beckins")
    
    let theNationalLibrary = Library()
    theNationalLibrary.addBooks(booksToAdd: [book789, book548, book631, book465, book549])
    theNationalLibrary.addOwners(ownersToAdd: [user1134, user2756, user4758])
    
    theNationalLibrary.borrowAvailableBooks(owner: user1134, books: [book465, book549, book789])
    theNationalLibrary.borrowAvailableBooks(owner: user4758, books: [book548])
    
    print("Available Books:")
    for book in theNationalLibrary.booksAvailable() {
        print("Book: \(book.bookID) - \(book.title)")
    }
    
    print("Borrowed Books:")
    for book in theNationalLibrary.booksBorrowed() {
        print("Book: \(book.bookID) - \(book.title)")
    }
    
    user1134.returnBook(book: book789)
    
    print("Currently Available Books (after return):")
    for book in theNationalLibrary.booksAvailable() {
        print("Book: \(book.bookID) - \(book.title)")
    }
    
    print("Borrowed Books by Owner: user1134")
    if let ownerExists = theNationalLibrary.searchForOwner(ownerIDToSearch: user1134.ownerID) {
        for book in theNationalLibrary.booksBorrowedByOwner(owner: user1134) {
            print("Book: \(book.bookID) - \(book.title)")
        }
    }
}


task(for: 2, exercise: "პატარა E-commerce სისტემა") {
    
    //  2.1. შევქმნათ Class Product, შევქმნათ შემდეგი properties productID (უნიკალური იდენტიფიკატორი Int), String name, Double price. შევქმნათ Designated Init.
    
    class Product {
        let productID: Int
        let name: String
        let price: Double
        
        init(productID: Int, name: String, price: Double) {
            self.productID = productID
            self.name = name
            self.price = price
        }
    }
    
    //  2.2. შევქმნათ Class Cart Properties: cartID(უნიკალური იდენტიფიკატორი Int), Product-ების Array სახელად items. შევქმნათ Designated Init. Method იმისათვის რომ ჩვენს კალათაში დავამატოთ პროდუქტი. Method იმისათვის რომ ჩვენი კალათიდან წავშალოთ პროდუქტი მისი აიდით. Method რომელიც დაგვითვლის ფასს ყველა იმ არსებული პროდუქტის რომელიც ჩვენს კალათაშია.
    
    class Cart {
        let cartID: Int
        var items: [Product]
        
        init( cartID: Int, items: [Product] = []) {
            self.cartID = cartID
            self.items = items
        }
        
        func addProductToTheCart(itemToAdd: Product)  {
            items.append(itemToAdd)
        }
        
        func removeProductFromTheCart(itemId: Int)  {
            items.removeAll { $0.productID == itemId }
        }
        
        func priceCounter() -> Double {
            items.reduce(0.0) { $0 + $1.price }
        }
    }
    
    //  2.3. შევქმნათ Class User Properties: userID(უნიკალური იდენტიფიკატორი Int), String username, Cart cart. Designated Init. Method რომელიც კალათაში ამატებს პროდუქტს. Method რომელიც კალათიდან უშლის პროდუქტს. Method რომელიც checkout (გადახდის)  იმიტაციას გააკეთებს დაგვითვლის თანხას და გაასუფთავებს ჩვენს shopping cart-ს.
    
    class User {
        var userID: Int
        var username: String
        var cart: Cart
        
        init(userID: Int, username: String, cart: Cart) {
            self.userID = userID
            self.username = username
            self.cart = cart
        }
        
        func addInCart(productToAdd: Product) {
            cart.addProductToTheCart(itemToAdd: productToAdd)
        }
        
        func removeFromCart(productId: Int) {
            cart.removeProductFromTheCart(itemId: productId)
        }
        
        func checkout() -> Double {
            let totalPrice = cart.priceCounter()
            cart.items.removeAll()
            return totalPrice
        }
    }
    
    //  2.4. გავაკეთოთ იმიტაცია და ვამუშაოთ ჩვენი ობიექტები ერთად. შევქმნათ რამოდენიმე პროდუქტი. შევქმნათ 2 user-ი, თავისი კალათებით, დავუმატოთ ამ იუზერებს კალათებში სხვადასხვა პროდუქტები, დავბეჭდოთ price ყველა item-ის ამ იუზერების კალათიდან. და ბოლოს გავაკეთოთ სიმულაცია ჩექაუთის, დავაბეჭდინოთ იუზერების გადასხდელი თანხა და გავუსუფთაოთ კალათები.
    
    let sunglasses = Product(productID: 1, name: "Sunglasses", price: 149.99)
    let belt = Product(productID: 2, name: "Belt", price: 58.6)
    let hat = Product(productID: 3, name: "Hat", price: 27.2)
    let lipstick = Product(productID: 4, name: "Lipstick", price: 20.7)
    
    let user1Cart = Cart(cartID: 110)
    let user1 = User(userID: 1, username: "Sarah", cart: user1Cart)
    
    let user2Cart = Cart(cartID: 144)
    let user2 = User(userID: 2, username: "Jesica", cart: user2Cart)
    
    user1.addInCart(productToAdd: sunglasses)
    user1.addInCart(productToAdd: hat)
    print("Total price for user1: \(user1.cart.priceCounter()) for \(user1.cart.items.count) items")
    print("Checkout: \(user1.checkout())")
    print("Items left in cart: \(user1.cart.items.count)")
    
    
    
    user2.addInCart(productToAdd: sunglasses)
    user2.addInCart(productToAdd: hat)
    user2.addInCart(productToAdd: lipstick)
    print("Total price for user2: \(user2.cart.priceCounter()) for \(user2.cart.items.count) items")
    user2.removeFromCart(productId: lipstick.productID)
    print("Total price for user2: \(user2.cart.priceCounter()) for \(user2.cart.items.count) items")
    print("Checkout: \(user2.checkout())")
    print("Items left in cart: \(user2.cart.items.count)")
}
