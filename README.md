VerimiPhotoApp

**Tech Stack:**
SwiftUI    
Swift    
SwiftData    
MVVM    

Keeping its simple scope in mind I have implemented it with basic MVVM. But the architecture is scalable. If in future there is more complexity, we can add more layers as per clean architecture. These layers like UseCase, Reporitory etc can further help application to adhere to SOLID principals. Thus making sure clean coding practices are followed.

The application doesn't involve any complex data flow or processing. Most of the time data is to be fed to UI from remote or from local data sources so I decided not to use Combine. I have used combine for many years but here I thought as per the current scope of the application Async/Await should be sufficient. If the scope increases combine apis can be easily integrated.

I have also added unit test cases for non UI classes.

**External Frameworks:**

**SDWebImage:** The application relies heavily on remote images and there are huge number of images which are downloaded. I initialy decided to use AsyncImage to display remote images but it doesn't support caching of images. Without caching the performance was not smooth. So to implement caching I used external framework SDWebImage which is widely used and a framework that is widely trusted by developers.

