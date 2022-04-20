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
Then log in to the ADF instance provisioned and set up the MI:

Also connect to the logic app in the portal and authorize the api connection:


Alternatively:

### Infrastructure 
Run locally from the infrastructure pipeline via terraform.
### DB config
Run each of the scripts in the database folder.
### ADF config
Run the az cli commands from the pipeline to configure 
* [the datasets](https://github.com/hmcts/vh-reports/blob/b34d41f746aa03baec6073306779a9e7e600de6f/azure-pipelines.yml#L119)
* [pipelines](https://github.com/hmcts/vh-reports/blob/b34d41f746aa03baec6073306779a9e7e600de6f/azure-pipelines.yml#L134)
* and [triggers](az datafactory trigger create --resource-group vh-reporting-infra-${{ parameters.environment }} --factory-name "vh-datafactory-${{ parameters.environment }}" --name "$fileName" --properties "$file")
supplying the relevant files from the dataset/pipeline/trigger folders.





