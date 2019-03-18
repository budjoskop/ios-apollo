//
//  ViewController.swift
//  testFetch
//
//  Created by ognjen on 2/24/19.
//  Copyright © 2019 ognjen. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let fetchedArray = [Any]()
    
    @IBOutlet weak var labelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadData()
       
    }
    

 
    
    func loadData () {
     
        let query = ViewControllerQuery()
        
        Apollo.shared.client.fetch(query: query) { (result, error) in
            
            if let error = error {
                print("There was an error trying to feth data, error is: \(error)")
            }
            
            guard let data = result?.data  else {return}
            let dataTwo = data.nodes!
            //let filteredArray = dataTwo.compactMap({$0?.elements?.compactMap({$0?.data})})
            let filteredArray = dataTwo.compactMap({$0?.elements?.compactMap({$0?.data})})
            var helperArray = [Any]()
//            print(filteredArray[0][0]["file"])
            let forTest = filteredArray[0][0]["file"] as! [String:Any]
            print(filteredArray.count)
       
            print(helperArray)
            print(forTest["url"])
        
            do {

               //Convert to Data
                let jsonData = try JSONSerialization.data(withJSONObject: filteredArray, options: JSONSerialization.WritingOptions.prettyPrinted)

              //In production, you usually want to try and cast as the root data structure. Here we are casting as a dictionary. If the root object is an array cast as [Any].
                let json = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as! [[[String:Any]]]
                print(JSONSerialization.isValidJSONObject(json))

                print(json)

              

                //print(json[1][0]["file"])




                func jsonFunc(from object: Any) -> String? {
                    guard let data = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted) else {
                        return nil
                    }
                    return String(data: data, encoding: String.Encoding.utf8)
                }

                let jsonDecoder = JSONDecoder()

                let urls = try jsonDecoder.decode([File].self, from:jsonData)




            } catch {
                print("There was an error trying to decode \(error)")
            }

            


        }
    
    }
    

    

}


