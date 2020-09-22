# Configuring Access to Cape Enterprise via Azure Active Directory

## Create an Application in Active Directory

Next you will configure an application to grant your Cape deployment permission to access Azure resources for AzureAD authentication and Azure Key Vault Key Management.

1. From the Azure portal, select __Azure Active Directory__.

2. On the left hand pane, select __App Registrations__.

3. Select __New registration__

    ![App registrations](/assets/images/azure/app_registrations.png)

4. Name your application 'cape-coordinator', and enter https://<your cape URL>/oauth/azure/callback as the Redirect URI

    ![Enter application name and Redirect URI](/assets/images/azure/register_an_application.png)

5. Select __Register__

### Grant Permissions to enable Cape Enterprise Coordinator to use AzureAD authentication

1. From the Overview page, select __View API permissions__

    ![App registration overview](/assets/images/azure/app_registration_overview.png)

2. Select __Add a permision__

3. Select __Microsoft Graph__

4. Select __User__ and then __User.Read__

### Generate Client secrets

1. In the left-hand pane, select __Certificates & secrets__

2. Select __New client secret__

3. Enter 'cape-coordinator' in the Description field

4. Select __Add__

5. Copy the Value of the created secret for the helm configuration below.

## Update the Helm chart configuration

```
azure:
  tenantID: <azure tenant ID>
  clientID: <azure client ID>
  clientSecret: <azure client secret>
```
