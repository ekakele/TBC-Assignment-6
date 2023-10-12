//Lecture 8 - Class & Inheritance

task(for: 3, exercise: "სავარჯიშოები კლასებსა და მემკვიდრებითობაზე") {
    
    //  3.1 Class-ი სახელით Animal, with properties: name, species, age. ამ class აქვს: Designated init ამ properties ინიციალიზაციისთვის.Method makeSound() რომელიც დაგვი-print-ავს ცხოველის ხმას.
    
    class Animal {
        var name: String
        var species: String
        var age: Int
        
        init(name: String, species: String, age: Int) {
            self.name = name
            self.species = species
            self.age = age
        }
        
        //  3.8. აბსტრაქციისათვის Animal class დავუმატოთ required init() შიგნით აღწერილი fatal error-ით სადაც ვიტყვით რომ Animal class არის აბსტრაქტული და არ უნდა იყოს მისი შექმნა პირდაპირ შესაძლებელი.
        
        required init() {
            fatalError("'Animal' Class is abstract and it's not possible to create an object directly from it.")
        }
        
        func makeSound() {
            print("animal🔊")
        }
    }
    
    
    //  3.2 Animal-ის child class სახელად Mammal (ძუძუმწოვრები). დამატებითი String property -> furColor. Override method makeSound() სადაც აღწერთ შესაბამის ხმას. Init-ი -> სახელით, ასაკით, ბეწვის ფერით. convenience init -> სახელით, ბეწვის ფერით.
    
    class Mammal: Animal {
        var furColor: String
        
        init(name: String, species: String, age: Int, furColor: String) {
            self.furColor = furColor
            super.init(name: name, species: species, age: age)
        }
        
        required init() {
            fatalError("init() has not been implemented")
        }
        
        override func makeSound() {
            print("mammal🔊")
        }
    }
    //    let cow = Mammal(name: "cow", species: "dod", age: 10, furColor: "brune")
    //    print(cow.makeSound())
    //    cow.age
    
    
    //  3.3. Animal-ის child class: Bird. დამატებითი Bool property: canFly. Override method makeSound() სადაც ავღწერ შესაბამის ხმას. Init -> სახელით, ასაკით, შეუძლია თუ არა ფრენა. convenience init -> სახელით, შეუძლია თუ არა ფრენა.
    
    class Bird: Animal {
        var canFly: Bool
        
        init(name: String, species: String, age: Int, canFly: Bool) {
            self.canFly = canFly
            super.init(name: name, species: species, age: age)
        }
        
        //        convenience init(name: String, canFly: Bool) {
        //            self.init(name: name, species: species, age: age, canFly: canFly)
        //        }
        
        convenience init(name: String, canFly: Bool) {
            // Set default values before calling the designated initializer
            let defaultSpecies = "Unknown"
            let defaultAge = 0
            self.init(name: name, species: defaultSpecies, age: defaultAge, canFly: canFly)
        }
        
        required init() {
            fatalError("init() has not been implemented")
        }
        
        override func makeSound() {
            print("bird🔊")
        }
    }
    
    
    //  3.4. Animal-ის child class: Reptile. დამატებითი Bool property: isColdBlooded. Override method makeSound() სადაც ავღწერ შესაბამის ხმას. Failable Init თუ რეპტილიას ასაკი ნაკლებია 0-ზე ვაბრუნებთ nil-ს.
    
    class Reptile: Animal {
        var isColdBlooded: Bool
        
        init(name: String, species: String, age: Int, isColdBlooded: Bool) {
            self.isColdBlooded = isColdBlooded
            super.init(name: name, species: species, age: age)
        }
        
        required init() {
            fatalError("init() has not been implemented")
        }
        
        //        //failable initializer to handle edge case:
        //        init?(age: Int) {
        //            if age < 0 { return nil }
        //        }
        //        init?(name: String, species: String, age: Int) {
        //                self.isColdBlooded = false // Default value
        //                super.init(name: name, species: species, age: age) // Call the designated initializer of the superclass
        //                if age < 0 {
        //                    return nil // Return nil if age is negative
        //                }
        //            }
        
        override func makeSound() {
            print("reptile🔊")
        }
    }
    
    
    //  3.5. Mammal-ის child class: Lion. დამატებით String property: maneColor. Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.
    
    class Lion: Mammal {
        var maneColor: String
        
        init(name: String, species: String, age: Int, furColor: String, maneColor: String) {
            self.maneColor = maneColor
            super.init(name: name, species: species, age: age, furColor: furColor)
        }
        
        required init() {
            fatalError("init() has not been implemented")
        }
        
        override func makeSound() {
            print("🦁🔊")
        }
    }
    
    
    //  3.6. Bird-ის child class: Eagle. დამატებით Double property: wingspan. Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.
    
    class Eagle: Bird {
        var wingspan: Double
        
        init(name: String, species: String, age: Int, canFly: Bool, wingspan: Double) {
            self.wingspan = wingspan
            super.init(name: name, species: species, age: age, canFly: canFly)
        }
        
        required init() {
            fatalError("init() has not been implemented")
        }
        
        override func makeSound() {
            print("🦅🔊")
        }
    }
    
    
    //  3.7. Reptile-ის child class: Snake. დამატებით Double property: length. Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.
    
    class Snake: Reptile {
        var length: Double
        
        init(name: String, species: String, age: Int, isColdBlooded: Bool, length: Double) {
            self.length = length
            super.init(name: name, species: species, age: age, isColdBlooded: isColdBlooded)
        }
        
        required init() {
            fatalError("init() has not been implemented")
        }
        
        override func makeSound() {
            print("🐍🔊")
        }
    }
    
    
    //  3.9. შევქმნათ ზოოპარკის ცხოველების Array, დავამატოთ მასში სხვადასხვა სახის ცხოველები: 2-2 Mammal, Bird, Reptile ასევე შევქმნათ 1-1 Lion, Eagle, Snake.
    
    var zooAnimals: [Animal] = []
    
    let polarBear = Mammal(name: "Boo", species: "Polar Bear", age: 12, furColor: "White")
    let dolphin = Mammal(name: "Sam", species: "Dolphin", age: 10, furColor: "None")
    
    let sparrow = Bird(name: "Nancy", species: "House Sparrow", age: 2, canFly: true)
    let woodpecker = Bird(name: "Woody", species: "Downy Woodpecker", age: 3, canFly: true)
    
    let turtle = Reptile(name: "Terry", species: "Box Turtle", age: 15, isColdBlooded: true)
    let lizard = Reptile(name: "Lizzy", species: "Bearded Dragon", age: 1, isColdBlooded: true)
    
    let lionKing = Lion(name: "Simba", species: "African Lion", age: 3, furColor: "Golden", maneColor: "Dark Brown")
    let eagleAquila = Eagle(name: "Aquila", species: "Bald Eagle", age: 7, canFly: true, wingspan: 2.2)
    let snakeKaa = Snake(name: "Kaa", species: "Python", age: 50, isColdBlooded: true, length: 1.3)
    
    zooAnimals += [polarBear, dolphin, sparrow, woodpecker, turtle, lizard, lionKing, eagleAquila, snakeKaa]
    
    
    //  3.10. დავბეჭდოთ ჩვენი Array-იდან, ყველა ცხოველის სახელი, სახეობა, ასაკი, და ასე გამოვიძახოთ makeSound მეთოდი.
    
    for i in zooAnimals {
        print("Animal Name: \(i.name), Species: \(i.species), Age: \(i.age)", terminator: " ")
        print("Sound:", terminator: " ")
        i.makeSound()
    }
}


