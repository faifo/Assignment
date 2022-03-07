# Long's Assignment

## App Flow
* Open Splash scene
* Request data at link https://raw.githubusercontent.com/SiriusiOS/ios-assignment/main/cities.json
* Prepair data:
1. Sort in alphabetical order
2. Build suffix tree. The ideal to increase search time is preprocess the data by building a suffix tree of text and we can search any pattern in O(m) time where m is length of the pattern. Referernce https://www.geeksforgeeks.org/pattern-searching-using-suffix-tree/
Example of suffix tree:<br />
```
input: ["Alabama", "Albuquerque", "Bnaheim", "Crizona"]
output: [""]: - models: ["Alabama", "Abuquerque", "Bnaheim", "Crizona"]
              - nodes:  ["A"]: - models: ["Alabama", "Abuquerque"]
                               - nodes:  ["Al"] - models: ["Alabama"]
                                                - nodes:  ...
                                         ["Ab"] - models: ["Abuquerque"]
                                                - nodes:  ...
                        ["B"]: - models: ["Bnaheim"]
                               - nodes:  ["Bn"] - models: ["Bnaheim"]
                                                - nodes:  ...
                        ["C"]: - models: ["Crizona"]
                               - nodes:  ["Cr"] - models: ["Crizona"]
                                                - nodes:  ...
```
* Show Search scene and search
* Tap to a city to open map scene and move to the coordinate

## VIP Architecture
Clean Swift (VIP) was first introduced by Raymond Law on his website clean-swift.com. The idea behind it was to tackle the Massive view controller problem while following the main ideas found in Uncle Bob’sClean Architecture.<br />
Referernce: <br />
https://hackernoon.com/introducing-clean-swift-architecture-vip-770a639ad7bf <br />
https://clean-swift.com/clean-swift-ios-architecture/

## Project structure

* Application/View: Build viewController in VIP architect with Models and Views
* Application/Foundation: Define all sharing code 
* Application/Foundation/Extension: Define extensions
* Application/Foundation/Network: Define network module
* Application/Foundation/Ultilities: Define reuse codes
* Application/Foundation/Extension: Define extensions
* Application/Foundation/Resources: add all resources, ex : files, fonts ...
