import UIKit

struct Person {
    var name: String
    var age: Int
}

class ViewController: UIViewController {

    var person: Person? {
        didSet{

            print("Called after setting the new value")
            if let name = person?.name {
                print("New name is \(name) and old name is \(String(describing: oldValue?.name))")
            }
        }
        willSet(myNewValue) {

            print("Called before setting the new value")
            if let newName = myNewValue?.name {
                print("New name is \(newName)")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        person = Person(name: "Shem", age: 4)
    }
}

let vc = ViewController()
vc.person = Person(name: "Shem", age: 4)
