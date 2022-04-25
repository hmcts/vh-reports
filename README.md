# vh-reports
## Purpose

This repo contains the reporting infrastructure and configuration for use with the VH product. 
Running [this pipeline](https://hmctsreform.visualstudio.com/VirtualHearings/_build?definitionId=214) will provision:
* a resource group vh-reporting-infra-env
* a blob storage container in the vh-core-infra-<env> storage account
* a vhreporting database in the vh-core-infra-<env> sql server instance
* a logic app within the above resource group that will pull relevant data into the above blob storage
* an ADF instance which will additionally be configured with:
    * linked services
    * ADF pipelines 
    * triggers required for the ADF pipelines

## Getting Started
Run the [vh-reports pipeline](https://hmctsreform.visualstudio.com/VirtualHearings/_build?definitionId=214)
Then log in to the ADF instance and set up the MI:
* Go to Manage -> Credentials -> Create New
* Give it a sensible name (like vh-adf-mid-<env>)
* Choose User Assigned Managed Identity for type
* Select the relevant subscription and then choose the vh-adf-mi-<env> Managed Identity:
![Alt text](images/ADF_Credentials.png?raw=true "Logic App Authorize API")
* Publish your change
* Finally go to Linked Services -> vhreporting-kv-link
* Change the Authentication to User Assigned Managed Identity and choose the Credential created above.
* Hit Save and Publish your changes 

Connect to the logic app in the portal and authorize the api connection:
![Alt text](images/logic_app_auth.png?raw=true "Logic App Authorize API")

Alternatively:

### Infrastructure 
Run locally from the infrastructure folder via terraform.
### DB config
Run each of the scripts in the database folder.
### ADF config
Run the az cli commands from the pipeline to configure: 
* [the datasets](https://github.com/hmcts/vh-reports/blob/b34d41f746aa03baec6073306779a9e7e600de6f/azure-pipelines.yml#L119)
* [pipelines](https://github.com/hmcts/vh-reports/blob/b34d41f746aa03baec6073306779a9e7e600de6f/azure-pipelines.yml#L134)
* and [triggers](https://github.com/hmcts/vh-reports/blob/f11a7fa9c72a1852d7ebf4c44a9aa3d8a47b69e8/azure-pipelines.yml#L149)
supplying the relevant files from the dataset/pipeline/trigger folders.





