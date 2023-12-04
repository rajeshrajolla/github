#!/bin/bash

# Clone the repository
git clone ssh://rajesh@spareit.co.in@source.developers.google.com:2022/p/avian-safeguard-308206/r/spareit-flutter-gc

cd spareit-flutter-gc

# Fetch all branches from the remote repository
git fetch --all

# List remote branches and check them out
for branch in $(git branch -r | grep -v '\->' | sed 's/origin\///'); do
    git checkout -b $branch origin/$branch
done


================================================
how to clone all the repos and branches to Local
================================================
Ans: 
step1: git clone ssh://rajollarajesh19@gmail.com@source.developers.google.com:2022/p/test-projec-1-398410/r/<reponame>----> it will clone master branch

step2: git branch -r ---------> To check remote branches

step3: git fetch --all

step4: git checkout <branch1> 

step4: git fetch --all

==============================================================================================================
 git fetch---------------->Fetch Remote Branches
 
 git branch -r ----------> List Remote and Local Branches
 
 git branch --------------> To list all local branches, use:
 
 git remote show origin ---------> Identify Local/Remote Branch Relationships 
 
 git remote -v  -------------> Listing Remote Repositories
 
 git fetch <remote_name> --------> To retrieve changes from a remote repository to your local one, use:
 
 example: git fetch origin
 
 git pull <remote_name> <branch_name>  -----------> To fetch changes and merge them into your current branch, use:
 
 example: git pull origin main

git push <remote_name> <branch_name> --------> To send your local changes to a remote repository, use:

 example: git push origin main
======================================================================================================================
Error:To ssh://gmail.com@source.developers.google.com:2022/p/test-projec-2-403704/r/gms-abdul
 ! [remote rejected] abdul_dev -> abdul_dev (found a private key)
 ! [remote rejected] master -> master (found a private key)
error: failed to push some refs to 'ssh://gmail.com@source.developers.google.com:2022/p/test-projec-2-403704/r/gms-abdul'
=====================================================================================================================
git push --all google -o nokeycheck  -----------> use this command when you get above error


git remote add google ssh://rajollarajesh19@gmail.com@source.developers.google.com:2022/p/test-projec-2-403704/r/backend ----> adding remote repo with alias



===============================================================
step1: npm install -----------> first time on terminal

step2: docker build -t app .

step3: docker tag app gcr.io/test-projec-2-403704/saudi-dev

step4: docker push gcr.io/test-projec-2-403704/saudi-dev

===============================================================
1  docker build -t app .
2  docker tag app gcr.io/invoice-362011/spareit-international-gms
3  docker push gcr.io/invoice-362011/spareit-international-gms


1  docker build -t app .
2  docker tag app gcr.io/test-projec-2-403704/locate-backend
3  docker push gcr.io/test-projec-2-403704/locate-backend

petromin-express-131123

Service name morocco-gms-test
gclould auth login
gcloud auth configure-docker
gcloud config
gcloud config set project invoice-362011


Cloud build config file:
=======================
Build and push a container image:
-------------------------------
This cloudbuild.yaml simply invokes docker build and pushes the resulting image.
=================
Artifact Registry:
==================
steps:
- name: 'us-central1-docker.pkg.dev/cloud-builders/docker'
  args: ['build', '-t', 'us-central1-docker.pkg.dev/test-projec-2-403704/saudi-dev', '.']
images: ['us-central1-docker.pkg.dev/test-projec-2-403704/saudi-dev']

=================
 container Registry: 
==================
1.cloudbuild.yaml -------> working 
steps:
# Uses the docker build step to build an image called my-image
- name: 'gcr.io/cloud-builders/docker'
  args: ['build', '-t', 'gcr.io/test-projec-2-403704/saudi-dev:latest', '.']
  
# my-image is pushed to Container Registry
images: ['gcr.io/test-projec-2-403704/saudi-dev:latest']

options:
  logging: CLOUD_LOGGING_ONLY
  
  
  2.cloudbuil.yaml---------->it is working for build and push but failed deployment 
  
  steps:
# Build the container image
- name: 'gcr.io/cloud-builders/docker'
  args: ['build', '-t', 'gcr.io/test-projec-2-403704/saudi-dev', '.']
# Push the container image to Container Registry
- name: 'gcr.io/cloud-builders/docker'
  args: ['push', 'gcr.io/test-projec-2-403704/saudi-dev']
# Deploy container image to Cloud Run
- name: 'gcr.io/google.com/cloudsdktool/cloud-sdk'
  entrypoint: gcloud
  args: ['run', 'deploy', 'pe-morocco', '--image', 'gcr.io/test-projec-2-403704/saudi-dev', '--region', 'us-central1']
images:
- gcr.io/test-projec-2-403704/saudi-dev
  
  
  
 ///////////////////////////////////////////////////////////////////// 
  
# Uses the docker build step to build an image called my-image
- name: 'gcr.io/cloud-builders/docker'
  args: ['build', '-t', 'gcr.io/$PROJECT_ID/my-image', '.']

# my-image is pushed to Container Registry
images:
- 'gcr.io/$PROJECT_ID/my-image'
  
 =====
 Error
 =====
 solution for the following error "Your build failed to run: generic::invalid_argument: if 'build.service_account' is specified, the build must either (a) specify 'build.logs_bucket', (b) use the REGIONAL_USER_OWNED_BUCKET build.options.default_logs_bucket_behavior option, or (c) use either CLOUD_LOGGING_ONLY / NONE logging options"
ChatGPT
The error message indicates that there's an issue with your Cloud Build configuration related to the build.service_account setting and the logs configuration. When you specify a custom service account for Cloud Build (build.service_account), you need to configure where the build logs will be stored.

Here are potential solutions based on the error message:

Specify a Logs Bucket (Option A):
You can specify a bucket for storing build logs using the build.logs_bucket option. Update your cloudbuild.yaml file to include a logs_bucket:

yaml
Copy code
options:
  logsBucket: 'your-logs-bucket'
  
  
  
Use REGIONAL_USER_OWNED_BUCKET (Option B):
Alternatively, you can use the REGIONAL_USER_OWNED_BUCKET option for logs by setting build.options.default_logs_bucket_behavior:

yaml
Copy code
options:
  default_logs_bucket_behavior: REGIONAL_USER_OWNED_BUCKET
  
  
Use CLOUD_LOGGING_ONLY / NONE (Option C):
If you don't want to store build logs in a Cloud Storage bucket, you can configure the build to use Cloud Logging only or disable logging:

yaml
Copy code
options:

  logging: CLOUD_LOGGING_ONLY
or

yaml
Copy code
options:
  logging: NONE
  
  
Choose the option that best fits your use case and add it to your cloudbuild.yaml file.


=============
spareit-docs:
=============
step2: docker build -t app .

step3: docker tag app gcr.io/invoice-362011/spareit-docs

step4: docker push gcr.io/invoice-362011/spareit-docs


docker tag app gcr.io/test-projec-2-403704/catalogue-image:latest

docker push gcr.io/test-projec-2-403704/catalogue-image:latest

#cloudbuild yaml file for container registry
steps:
  - name: 'gcr.io/cloud-builders/docker'
    args: ['build', '-t', 'gcr.io/invoice-362011/catalogue-image', '.']
	
  - name: 'gcr.io/cloud-builders/docker'
    args: ['push', 'gcr.io/invoice-362011/catalogue-image']

  - name: 'gcr.io/cloud-builders/gcloud'
    args:
      - 'run'
      - 'deploy'
      - 'auto-mast-egypt' # cloud run service name
      - '--image=gcr.io/invoice-362011/catalogue-image'
      - '--platform=managed'
      - '--region=asia-south1'
      - '--port=8080'

images:
  - 'gcr.io/invoice-362011/catalogue-image'
options:
  logging: CLOUD_LOGGING_ONLY



NODE_ENV:production
FLAVOR:auto-mast-egypt
INSTANCE_UNIX_SOCKET:/cloudsql/invoice-362011:asia-south1:spareit-inhouse


locate-pe-saudi-staging-service


https://source.cloud.google.com/invoice-362011/locate-backend-pe-saudi/+/hashir-dev:

Number  Start    End        Size       File system  Name  Flags
14      2048s    10239s     8192s                         bios_grub
15      10240s   227327s    217088s    fat32              boot, esp
 1      227328s  41943006s  41715679s  ext4
 
 
 sq3y6.onmicrosoft.com
 
 bharath@sq3y6.onmicrosoft.com
 
 
 
 
 
 
 
 1 gcloud source repos clone gms-backend-new --project=invoice-362011
 2 git branch -v -r
 
   origin/HEAD                               -> origin/master
  origin/abdul_dev                          89968d8 auto deploy script
  origin/gms_backend_v1                     25e75cd login logic changed
  origin/gms_backend_v2                     cae710e added some code related to category
  origin/gms_backend_v3_egypt               1fca644 added missing
  origin/gms_backend_v3_morocco_changes_add 725193b added code
  origin/gms_backend_v3_test_bucket         5088681 added code with bay and bucket test
  origin/gms_backend_v3_with_image          e1eefaf added code for bucket and bay related
  origin/gms_egypt_test_local               1284e70 added code
  origin/master                             7cda87d Merge branch 'gms_backend_v1'
  
  3 git pull origin abdul_dev
  
  4 git pull --all
  
  5 
 
 