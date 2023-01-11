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
This ADF is setup in Git Mode. This means it does not follow a standard CI/CD.

DevOps will write/build the terraform as normal, but the ADF configuration is developed within ADF.

ADF Config development will go as:
1. Developer accesses `Dev` ADF and makes configuration changes.
2. They will `Publish` the changes via ADF to this repo on the branch `adf_publish`.
3. They will make a  Pull Request to `master`, which will trigger an automated deployment to `Dev`
4. Once merged will/can deploy to other environments.

The second deployment on point 3 is to make sure the automation is working and the environment is kept up to data with terraform.

You read more here: https://learn.microsoft.com/en-us/azure/data-factory/continuous-integration-delivery#cicd-lifecycle

## Known Issues

### Terraform Private Endpoint already exists
If you see an error like this:

`Error: A resource with the ID "/subscriptions/705b2731-0e0b-4df7-8630-95f157f0a347/resourceGroups/vh-reporting-infra-dev/providers/Microsoft.DataFactory/factories/vh-datafactory-dev/managedVirtualNetworks/default/managedPrivateEndpoints/vhadfendpoint" already exists - to be managed via Terraform this resource needs to be imported into the State. Please see the resource documentation for "azurerm_data_factory_managed_private_endpoint" for more information.`

Rerun the pipelines before the Plan stag and it will work.


## More Information
Confluence: 
*   [Vh Reporting on Confluence](https://tools.hmcts.net/confluence/display/VIH/VH+Reporting)  
*   [Confluence page on deployment](https://tools.hmcts.net/confluence/display/VIH/Deployment+of+Current+VH-Reporting+Infrastructure)




