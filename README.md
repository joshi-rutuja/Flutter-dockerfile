# Steps to Containerize your app locally and deploy it on Cloud Run

* Prerequisites:

   *Install Docker Desktop* 
	 
	 
   *Install Cloud SDK Shell*
                      
                      
To  deploy a Web App on Cloud Run, you need to follow these steps:

   **1. Create a Google Cloud project**
 
   **2. Create a Flutter WebApp project**
 
   **3. Containerizing the WebApp locally**
 
   **4. Deploy the image on Cloud Run**
 
 
 
 
## 1.	Create a Google Platform Project
         
   a.	  Create a Google cloud console account
   
   b.	  Go to Billing section and set budget alerts
   
   c.	  Enable the Cloud Build, Cloud Run, Container Registry, and Resource Manager APIs.
   
   d.	  Create your first project
    
    
## 2.	Create a Flutter Web App project

   a.	  Create a Flutter project or use a existing project
  
   b.	  Add the attached Dockerfile into the Project root
   
   c.	  Create a server Directory and a server.sh file inside the server folder 


##  3.	Containerizing the WebApp locally

   a.	  Now your Directory structure might look like this
   
   ![directory structure](https://user-images.githubusercontent.com/96573282/148927136-db0faa86-e5eb-44d7-82f0-5924800cc59a.png)
        
   
   b.	  Open the terminal from the application root folder and run the following command:
	 
	 
	 
          docker build . -t flutter_docker
					
   c.	  This will build a Docker image with the name flutter_docker. You can view this image from the installed Docker desktop application. You can            also view the image with the command docker images.
   
   ![check dockr images](https://user-images.githubusercontent.com/96573282/148954099-61723298-2029-43d1-b4db-57e9f67f3c08.png)

        
   
   d.  	Run the image container
        Run the following command: 
				
				
          docker run -i -p 8080:8080 -td flutter_docker
   This command binds the port 5000 configured in the container to the TCP port 8080, accessible from the browser.
        
   
   e.	Proceed to view the application on localhost:8080 on your browser.
 

##  4.	Push the image to Container registry

   a.	Open your Cloud sdk
    
   b.	Run the following command on your Cloud sdk shell to check the images in your docker
	 
	 
	
          docker images
          
   c.	Configure authenctication
        Before you can push or pull images, you must configure Docker to use the gcloud command-line tool to authenticate requests to Container               Registry.
          #### **gcloud auth configure-docker**
          

   d.	Add the image to container registry
	 
   i.	To add an image to Container Registry, you tag it and then push it to the registry.
			 
			 
			
            docker tag imagename gcr.io/PROJECT_ID/imagename:latest*
						
					
  
   ii.	Push the image to Container Registry
	 
	 
            docker push gcr.io/PROJECT_ID/image-name
	    
	    
            
   e.	To confirm the image has been created, go to Google Cloud Platform > Navigation menu > Container Registry.
   
   ![check container registry](https://user-images.githubusercontent.com/96573282/148931218-1456c3d1-b0c7-4b90-b6e4-24127457ab7a.png)

 

##  5.	Deploy Docker image to Cloud Run

   a.	You can deploy a container image that is stored in the Container Registry in the same project. 
	 Go to Cloud Platform > Navigation menu > Cloud Run > Create Service
	 
   ![create service](https://user-images.githubusercontent.com/96573282/148931485-7c9b8f34-9ea9-4223-bfd8-5df1a78821fd.png)
   
   
   b.	Choose the image you want to deploy
	
   ![select image](https://user-images.githubusercontent.com/96573282/148931722-880b3de2-5643-45fc-9be5-860cec32c6fc.png)
   
   
  
   c.	Select service name and region
    
   d.	Check ‘Allow unauthenticated invocations’
    
   e.	Click ‘Create’ Button and wait for few minutes
   
   f.	Once deployment is done, click your URL on the upper side corner to check your WebApp


