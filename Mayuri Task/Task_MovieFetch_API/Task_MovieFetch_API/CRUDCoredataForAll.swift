

import UIKit
import CoreData

struct CRUD
{
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    

    
    
    
   
    
    
    
    static func insertValue(entitiyName:String,title:String,image:String,overview:String,releaseDate:String,rating:String)
    {
        guard let entity = NSEntityDescription.entity(forEntityName: entitiyName, in: context) else
        {
            print("Error In Entity Description")
            return
            
        }
        
        let managedObject = NSManagedObject(entity: entity, insertInto: context)
        
        
        
        managedObject.setValue(title, forKey: CD.title())
        managedObject.setValue(image, forKey: CD.image())
        managedObject.setValue(overview, forKey: CD.overview())
        managedObject.setValue(releaseDate, forKey: CD.releaseDate())
        managedObject.setValue(rating, forKey: CD.rating())
        
        
        do
        {
            try context.save()
            
            print("Data Inserted Sucessfully")
        }
        catch
        {
            print("Catch Error : Failed To Insert Data")
        }
        
    }
    
    
    
    
    
    
    //Fetch All Data
    static func fetchData(entityName:String) -> [NSManagedObject]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        
        
        var data:[NSManagedObject]!
        do
        {
            data = try context.fetch(fetchRequest) as! [NSManagedObject]
        }
        catch
        {
            print("Catch Error : Failed To Fetch Data")
        }
        
        return data
        
    }
    
    
    
    
    
    
    static func deleteData(entityName:String,referenceColumnName columnName: String,referenceColumnValue columnValue:String?)
    {
        let data = CRUD.fetchData(entityName: entityName)
        
        
        for x in data
        {
            if(x.value(forKey: columnName) as? String == columnValue)
            {
                context.delete(x)
            }
        }
        
        
        do
        {
            try context.save()
        }
        catch
        {
            print("Failed To Delete")
        }
    }
    
    
    static func deleteAll(entityName:String)
    {
        let data = CRUD.fetchData(entityName: entityName)
        
        for x in data
        {
            context.delete(x)
        }
        
        do
        {
            try context.save()
            
            print("All Data Deleted Sucessfully")
        }
        catch
        {
            print("Error : Failed To Delete All")
        }
    }
    
    
    enum dataType:String
    {
        case int16 = "Int16"
        case int32 = "Int32"
        case int64 = "Int64"
        case string = "String"
        case bool = "Bool"
        case data = "DataT"
    }
}

