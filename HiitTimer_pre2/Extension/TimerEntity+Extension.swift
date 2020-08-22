//
//  TimerEntity+Extension.swift
//  HiitTimer
//
//  Created by がり on 2020/08/19.
//  Copyright © 2020 がり. All rights reserved.
//

import CoreData
import SwiftUI

extension TimerEntity: Identifiable{}
extension TimerEntity{
    
    static func create(in managedObjectContext: NSManagedObjectContext,
                       training: TIMES,
                       interval: INTERVALS,
                       numOfTimes: NUMBEROFTIMES){
        
        let timeCounter = self.init(context: managedObjectContext)
        timeCounter.training = training.rawValue
        timeCounter.interval = interval.rawValue
        timeCounter.numOfTimes = numOfTimes.rawValue
        
        do {
            try  managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    
    enum TIMES: Int16 {
        case time10
        case time20
        case time30
        case time40
        case time50
        case time60
        case time70
        case time80
        case time90
        case time100
        case time110
        case time120
    }
    
    enum INTERVALS: Int16 {
        case interval10
        case interval20
        case interval30
        case interval40
        case interval50
        case interval60
        case interval70
        case interval80
        case interval90
        case interval100
        case interval110
        case interval120
    }
    
    enum NUMBEROFTIMES: Int16 {
        case num1
        case num2
        case num3
        case num4
        case num5
        case num6
        case num7
        case num8
        case num9
        case num10
    }

    enum ISEND: Int16 {
        case notYet
        case done
    }
    
    
    static func counts(in managedObjectContext: NSManagedObjectContext,
                       category: Category,
                       task: String,
                       time: Date? = Date()){
        let todo = self.init(context: managedObjectContext)
        print(task)
        todo.time = time
        todo.category = category.rawValue
        todo.task = task
        todo.state = State.todo.rawValue
        
        do {
            try  managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
 */
}
