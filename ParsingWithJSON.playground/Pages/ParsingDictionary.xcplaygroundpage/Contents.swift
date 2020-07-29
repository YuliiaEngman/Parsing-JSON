// Parsing Dictionary

import Foundation

// JSON Data
let json = """
{
 "results": [
   {
     "firstName": "John",
     "lastName": "Appleseed"
   },
  {
    "firstName": "Alex",
    "lastName": "Paul"
  }
 ]
}
""".data(using: .utf8)!

//===========================================================
// Create Model(s)
//===========================================================
// Codable: Decodable & Encodable
// Decodable: converts json data (read the JSON)
// Encodable: converts to json data to e.g. POST to a API

// Top level JSON is a Dictionary
struct ResultsWrapper: Decodable {
    let results: [Contact]
}

struct Contact: Decodable {
    let firstName: String
    let lastName: String
}

// =============================
// decode the JSON data to our Swift model
//==============================
do {
    let dictionary = try JSONDecoder().decode(ResultsWrapper.self, from: json) // always start with top level - here is a ResultsWrapper
    let contacts = dictionary.results // [Contact]
    dump(contacts)
} catch {
    print("decoding error: \(error)")
}
