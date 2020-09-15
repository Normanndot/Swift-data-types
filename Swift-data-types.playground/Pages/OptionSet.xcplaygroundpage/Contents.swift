import UIKit

struct TaskTypes: OptionSet {
    let rawValue: Int

    init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let urgent = TaskTypes(rawValue: 1 << 0) // 1
    public static let notUrgent = TaskTypes(rawValue: 1 << 1) // 2
    public static let easy = TaskTypes(rawValue: 1 << 2) // 4
    public static let hard = TaskTypes(rawValue: 1 << 3) // 8
}


struct Task {
    let title: String
    var taskTypes: TaskTypes

    init(title: String, taskTypes: TaskTypes) {
        self.title = title
        self.taskTypes = taskTypes
    }
}

func main() {
    let taskTypes: TaskTypes = [.notUrgent, .easy]
    let task = Task(title: "Not urgent task", taskTypes: taskTypes)

    if task.taskTypes.contains([.notUrgent, .easy]) {
        print("The task is easy and not urgent")
    }

    let task1 = Task(title: "Urgent but easy task", taskTypes: [.urgent, .easy])
    let task2 = Task(title: "Urgent and hard task", taskTypes: [.urgent, .hard])

    print(task1.taskTypes.intersection(task2.taskTypes))
    // Prints a rawValue of 1, because the common member is .urgent


    let task3 = Task(title: "Urgent task", taskTypes: [.urgent])
    let task4 = Task(title: "Hard task", taskTypes: [.hard])

    print(task3.taskTypes.union(task4.taskTypes))
}

main()
