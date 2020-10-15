.. _calm_api:

-------------------------------------
Calm: Nutanix API for Day 2 Operation
-------------------------------------

*The estimated time to complete this lab is 60 minutes.*

Pre-requisite:
++++++++++++++

#.  This course assumes the trainees have basic knowledge of Calm and understand the constructs in Calm.

#.  **Python** knowledge would be an added advantage but not essential.

#.  This lab requires the use of Postman.  Download and install Postman using this url.  For **Nutanix employee, install it in the notebook and connect to the VPN**.  For **partners & customers, create a new VM using disk image for WindowsTool.qcow2**.  

https://www.postman.com/downloads/

Product Configuration
+++++++++++++++++++++

#.  Prism Central 5.17.0.2
#.  Calm 2.10

Purpose of the lab
++++++++++++++++++

Nutanix Calm Marketplace and ServiceNow integration allowed our customer to provide self service of the underlying infrastructure like VM as a Service, Database as a Service, Kubernetes as a Service and Application as a Service etc.  However, some of our customers would like to use a 3rd party Cloud Management Portal or IT Service Management software like BMC Remedy, ManageEngine etc.  How can we help this group of customers to achieve this?

One of the key benefits in our Private Cloud solution was to bring public cloud experience into the private cloud.  Automation was a key driver behind this.  The objectives were to equip our automation SMEs with the skill sets to help our customers to streamline the process and integrate with disparate technologies through the use of api.


Create a Blueprint in Calm
++++++++++++++++++++++++++

Blueprint is like an architect blueprint which design every facet from the pillar columns to the facade of the building.  The automation designer design every aspects of the automation from the provisioning of the VM to installation of packages.  

#. Click on **Create Blueprint**.  

#. Choose **Multi-VM/pod** blueprint
   
   .. figure:: images/multi_vm_blueprints.png

#. Fill in the **blueprint name**.  Select the **Project**.  Click on **Proceed**.

   .. figure:: images/blueprint_name.png

#. Click on + sign to add a service.

   .. figure:: images/calm_service.png

#. Click on Credential to add a credential.  The credentials were used for the following purposes:

   - Login to the newly provisioned guest OS.
   - Credential to login to Prism Central or any 3rd party application.

   .. figure:: images/credential.png

#. Add in the **Credential** for Prism Central.  Get the password from the spreadsheet provided by the trainer.

   .. figure:: images/pc_credential.png

#. Fill out the following fields:

   - **Credential Name** - PC
   - **Username** - admin
   - **Secret Type** - password
   - **Password** - <Key in Prism Central password>

#. Create the credential for centos.  Fill out the following fields:


   - **Credential Name** - centos
   - **Username** - centos
   - **Secret Type** - ssh private key
   - **Key** - Paste in your own private key, or use:
   ::

     -----BEGIN RSA PRIVATE KEY-----
     MIIEowIBAAKCAQEAii7qFDhVadLx5lULAG/ooCUTA/ATSmXbArs+GdHxbUWd/bNG
     ZCXnaQ2L1mSVVGDxfTbSaTJ3En3tVlMtD2RjZPdhqWESCaoj2kXLYSiNDS9qz3SK
     6h822je/f9O9CzCTrw2XGhnDVwmNraUvO5wmQObCDthTXc72PcBOd6oa4ENsnuY9
     HtiETg29TZXgCYPFXipLBHSZYkBmGgccAeY9dq5ywiywBJLuoSovXkkRJk3cd7Gy
     hCRIwYzqfdgSmiAMYgJLrz/UuLxatPqXts2D8v1xqR9EPNZNzgd4QHK4of1lqsNR
     uz2SxkwqLcXSw0mGcAL8mIwVpzhPzwmENC5OrwIBJQKCAQB++q2WCkCmbtByyrAp
     6ktiukjTL6MGGGhjX/PgYA5IvINX1SvtU0NZnb7FAntiSz7GFrODQyFPQ0jL3bq0
     MrwzRDA6x+cPzMb/7RvBEIGdadfFjbAVaMqfAsul5SpBokKFLxU6lDb2CMdhS67c
     1K2Hv0qKLpHL0vAdEZQ2nFAMWETvVMzl0o1dQmyGzA0GTY8VYdCRsUbwNgvFMvBj
     8T/svzjpASDifa7IXlGaLrXfCH584zt7y+qjJ05O1G0NFslQ9n2wi7F93N8rHxgl
     JDE4OhfyaDyLL1UdBlBpjYPSUbX7D5NExLggWEVFEwx4JRaK6+aDdFDKbSBIidHf
     h45NAoGBANjANRKLBtcxmW4foK5ILTuFkOaowqj+2AIgT1ezCVpErHDFg0bkuvDk
     QVdsAJRX5//luSO30dI0OWWGjgmIUXD7iej0sjAPJjRAv8ai+MYyaLfkdqv1Oj5c
     oDC3KjmSdXTuWSYNvarsW+Uf2v7zlZlWesTnpV6gkZH3tX86iuiZAoGBAKM0mKX0
     EjFkJH65Ym7gIED2CUyuFqq4WsCUD2RakpYZyIBKZGr8MRni3I4z6Hqm+rxVW6Dj
     uFGQe5GhgPvO23UG1Y6nm0VkYgZq81TraZc/oMzignSC95w7OsLaLn6qp32Fje1M
     Ez2Yn0T3dDcu1twY8OoDuvWx5LFMJ3NoRJaHAoGBAJ4rZP+xj17DVElxBo0EPK7k
     7TKygDYhwDjnJSRSN0HfFg0agmQqXucjGuzEbyAkeN1Um9vLU+xrTHqEyIN/Jqxk
     hztKxzfTtBhK7M84p7M5iq+0jfMau8ykdOVHZAB/odHeXLrnbrr/gVQsAKw1NdDC
     kPCNXP/c9JrzB+c4juEVAoGBAJGPxmp/vTL4c5OebIxnCAKWP6VBUnyWliFhdYME
     rECvNkjoZ2ZWjKhijVw8Il+OAjlFNgwJXzP9Z0qJIAMuHa2QeUfhmFKlo4ku9LOF
     2rdUbNJpKD5m+IRsLX1az4W6zLwPVRHp56WjzFJEfGiRjzMBfOxkMSBSjbLjDm3Z
     iUf7AoGBALjvtjapDwlEa5/CFvzOVGFq4L/OJTBEBGx/SA4HUc3TFTtlY2hvTDPZ
     dQr/JBzLBUjCOBVuUuH3uW7hGhW+DnlzrfbfJATaRR8Ht6VU651T+Gbrr8EqNpCP
     gmznERCNf9Kaxl/hlyV5dZBe/2LIK+/jLGNu9EJLoraaCBFshJKF
     -----END RSA PRIVATE KEY-----

   .. figure:: images/centos_credential.png

#. Click **Save**, and then **Back**.


#. Look at the **Service1** on the right of the screen.

   .. figure:: images/service_name.png

#. Fill in the **VM Configuration**.

   .. figure:: images/vm.png

#. Copy the **cloud-init** contents into the screen.
  
   .. code-block:: bash
   
    #cloud-config
    users:
    - name: centos
    ssh-authorized-keys:
      - @@{centos_public_key}@@
    sudo: ['ALL=(ALL) NOPASSWD:ALL'] 

   .. note::

#. This is the picture of the cloud-init

   .. figure:: images/cloud-init.png

#. Choose the **Centos-7-x86_64-GenericCloud-18** image

   .. figure:: images/disk_image.png

#. Choose **Rx-Automation-Network** for Network Adapter

   .. figure:: images/blueprint_nic.png

#. Select **centos** for the credential.
 
   .. figure:: images/blueprint_credential.png

#. On the left side of the screen, click on **Default**.

   .. figure:: images/app_profile.png

#. On the right side of the screen, add a new variable.  This variable was essential to set the public cloud into the cloud-init of the GuestOS.

   .. figure:: images/variable_pk.png

#. Paste the contents of the ssh public key into the variable

   .. code-block:: bash
     
     ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAii7qFDhVadLx5lULAG/ooCUTA/ATSmXbArs+GdHxbUWd/bNGZCXnaQ2L1mSVVGDxfTbSaTJ3En3tVlMtD2RjZPdhqWESCaoj2kXLYSiNDS9qz3SK6h822je/f9O9CzCTrw2XGhnDVwmNraUvO5wmQObCDthTXc72PcBOd6oa4ENsnuY9HtiETg29TZXgCYPFXipLBHSZYkBmGgccAeY9dq5ywiywBJLuoSovXkkRJk3cd7GyhCRIwYzqfdgSmiAMYgJLrz/UuLxatPqXts2D8v1xqR9EPNZNzgd4QHK4of1lqsNRuz2SxkwqLcXSw0mGcAL8mIwVpzhPzwmENC5Orw== rsa-key-20190108

#. Launch the blueprint.  Fill in the **application name** & click on **Create**


   .. figure:: images/launch_bp.png

#. The application was started successfully.

   .. figure:: images/app_audit.png

Variables and Macros in Nutanix Calm
++++++++++++++++++++++++++++++++++++

Variables were essential part of a blueprint to allow repeated provisioning or automation.  Variables can either be static values saved as part of the Blueprint or they can be specified at **Runtime** (when the Blueprint is launched).  Variables are specific to a given **Application Profile**, which is the platform on which the blueprint will be deployed. For example, a blueprint capable of being deployed to both AHV and AWS would have 2 Application Profiles. Each profile could have individual variables and VM configurations.

In the earlier setup, a variable: centos_public_key was created. 

Macros enabled the designer to access the value of variables and properties that are set on entities. The variables could be user defined or system generated.  Macros made the scripts generic and allow creation of reusable workflows.

The macros was in the following format: @@{variable_name}@@ and could be referenced in the shell script, e-script and powershell.  An example is 
print @@{centos_public_key}@@
Please reference to this url to find out a list of system defined variables.

https://portal.nutanix.com/page/documents/details/?targetId=Nutanix-Calm-Admin-Operations-Guide-v2_10%3Anuc-components-macros-overview-c.html

Understand the Nutanix APIs
+++++++++++++++++++++++++++


When the customer would like to implement the self service of Nutanix infrastructure in their current ITSM software, the requirements would be the ability to perform the following operations.  

	#. Create Project
	#. Create User
	#. Associate User to a Project 
	#. Launch a Nutanix Calm blueprint to provision the VM
	#. Create VM Snapshot
	#. Change Memory or CPU

These operations were available in the Prism Central v3 API.  (https://www.nutanix.dev/reference/prism_central/v3/).

Nutanix APIs were available in REST (Representational State Transfer).  REST service could be easily consumed by the different browsers and 3rd party integrations in the familiar HTTP and HTTPS protocol.  These operations were available in the HTTP/HTTPS protocol and each operation served a purpose.

#. **GET** Retrieve representation of the member resource in the response body.

#. **POST** Create a member resource in the member resource using the instructions in the request body

#. **PUT** Replace all the representations of the member resource with the representation in the request body.

#. **PATCH** Update all the representations of the member resource or may create the member resource if it does not exist, using the instructions in the request body.

#. **DELETE** Delete all the representations of the member resource

Each API call would comprise of the following:

#. URL of the REST service
#. Authentication & Authorization
#. Type of Authentication: BASIC
#. Username
#. Password

#. Request Parameters.  The no of request parameters were dependent on the API.

#. Each API call would return the following status code: 

	- 200, 201 (OK) 
	- 404 (Not Found) 
  	- 403 (Authorization Error) 
  	- 500 (Internal Server Error)

#. Response Parameters.  The no of response parameters were dependent on the API

Use Nutanix for Day 2 Operation
+++++++++++++++++++++++++++++++

Clone the centOS VM
....................

The purpose for cloning the Centos VM is to allow the trainee to change the memory of the Centos VM.

#. Click on **Virtual Infrastructure->VM**.

   .. figure:: images/pc_vm.png

#.  Click on **Clone**.  Name it to **CentOS<trainee number>**
   .. figure:: images/vm_clone.png

Change the VM Memory
++++++++++++++++++++

Use Case
........

The application team may change the memory of the VM for the application optimum performance.  The application team would want to perform a self service to change the memory.  

Translate the use case into api operation
.........................................

The use case could be translated into 3 operations:

#. Retrieve a list of VMs for the user to select
#. Change to the new memory size and power off the VM
#. Power on the VM


Operation 1: Retrieve a list of VM for the user to select
..............................................................

#. Click on the link to examine the api to retrieve a list of VMs in the Nutanix clusters.

   
	https://www.nutanix.dev/reference/prism_central/v3/api/vms/postvmslist/


#. Each API call would comprise of the following:
	-  URL of the REST service. **https://<Prism Central IP>:9440/api/nutanix/v3/vms/list** 

	-  Authentication & Authorization
		+ Type of Authentication: **BASIC**

		+ Username: **admin**
		
    		+ Password: <Prism Central Password>

	-  These are the request parameters. 
 
		.. figure:: images/nutanix_api_pc.png

	-  This is an example of the request parameter.

   .. code-block:: bash
	
  	"kind": "vm",
  	"sort_order": "ASCENDING",
  	"offset": 0,
  	"length": 256,
  	"sort_attribute": "vm_name"

API Verification with Postman
.............................

#. Open the **Postman**.  Key in the **URL of the Prism Central**.  This is a **POST** request

   .. figure:: images/postman.png

#. Fill in the following in the **Authorization** tab.

   .. figure:: images/postman_authorization.png

#. Fill in the **Header**.

   .. figure:: images/postman_header.png

#. Fill in the following in the **Body**.

   .. figure:: images/postman_body.png

#. Click on **Send**

   .. figure:: images/postman_send.png

#. Scroll down to view the **response of the REST service call**.  This is an example of successful response

   .. figure:: images/postman_success.png

#. Take note of the response structure.  The **VM name** was in **entities.metadata.name**.  The **VM uuid** was in **entities.metadata.uuid**.  The VM name was used to display for user selection.  

   .. figure:: images/api_response.png

Create a dynamic variable in Calm
.................................. 

#. The purpose of this section is to create a drop down list of the VMs in the Nutanix cluster for user selection.

#. Login into Prism Central and go into Nutanix Calm.  Open the blueprint

#. Create the following variables:

	- PC_IP  **Store the value for Prism Central IP**

	- newMemSize  **Store the value for New Memory Size in Mb**


     .. figure:: images/variable_new_memory.png

#. Check the **Mark this variable mandatory** to allow the user to key in the new memory size.

   .. figure:: images/variable_mandatory.png

#. Create a dynamic variable named vmname

   .. figure:: images/variable_vmname.png

#. Examine the following python scripts.  This section of the python script configured the user name, password, Prism Central IP address (destination for the api) and the request structure.   Copy this contents into the escript

    .. code-block:: python
     
     user = "admin"
     password = "Fill in the password in your PC"
     ip = "Fill in the PC IP"
     
     def process_request(url, method, user, password, headers, payload=None):
      r = urlreq(url, verb=method, auth="BASIC", user=user, passwd=password, params=payload, 
     verify=False, headers=headers)
     return r


#. The payload was the mandatory request parameters to be passed into the api.  Please copy the contents into the escript

    .. code-block:: python
       
     payload = {
      "kind": "vm",
      "sort_order": "ASCENDING",
      "offset": 0,
      "length": 256,
      "sort_attribute": "vm_name"
     }


#. This section of the python script was to invoke the request to the api.  Copy this section of the scripts into the escript
  
    .. code-block:: python
       
     base_url = "https://" + ip + ":9440/api/nutanix/v3/vms"
     url = base_url + "/list"
     headers = {'Accept': 'application/json', 'Content-Type': 'application/json'}
     url_method = "POST"

     r = process_request(url, url_method, user, password, headers, json.dumps(payload))

#. This section of the python script was to extract the vm name from the api response

    .. code-block:: python
       
     vm_list = []
     vm_list_json = r.json()
     for vm in vm_list_json['entities']:
      if vm['spec']: #sometimes this value will be '{}'
        vm_list.append("{}".format(vm['spec']['name']))

     print ','.join(vm_list) 

#. This was the picture of the consolidated script.

   .. figure:: images/api_list_vm.png

#. Launch the blueprint to check on the display for the selection of the VM.

   .. figure:: images/calm_launch_bp.png

Operation 2: Retrieve the VM details, Update the new memory and power off the VM
................................................................................

#. Go to the **Service** on the right side of the screen.  Change the **Cloud** from **Nutanix** to **Existing Machine**.  Changing the VM memory is not to provision but automating on an existing machine.

   .. figure:: images/vm_existing_machine.png

#. Fill in an **IP address**.  Since the execution was based on the selection of the VM, the contents in this field does not matter.  

   .. figure:: images/vm_ip_address.png

#. Click on **Package->Install**.  Click on **+ Task**

   .. figure:: images/package_install.png

#. Name the task: **UpdateMemory**

	- Type: Execute 
	- Script Type: Escript

   .. figure:: images/task_update_memory.png

#. Refer to the following api to update the specification of the VM

   

	https://www.nutanix.dev/reference/prism_central/v3/api/vms/putvmsuuid/

   

#. Copy the contents into the escript.  This section of the escript defines the following:

	- Credential

	- Destination of the API: <Prism Central>

	- Define the structure for the http request.

    .. code-block:: python
      
     user = "@@{PC.username}@@"
     password = "@@{PC.secret}@@"
     ip = "@@{PC_IP}@@"

     def process_request(url, method, user, password, headers, payload=None):
     r = urlreq(url, verb=method, auth="BASIC", user=user, passwd=password, params=payload, verify=False, headers=headers)
     return r
   

#. Copy the contents into the escript.  This section of the escript define the request parameters to filter the specific VM instead of all the VMs in the cluster.
  
    .. code-block:: python
       
     payload = {
      "filter": "vm_name==@@{vmname}@@",
      "kind": "vm",
      "sort_order": "ASCENDING",
      "offset": 0,
      "length": 256,
      "sort_attribute": "vm_name"
     }  



#. Copy the contents into the escript.  This section will execute and retrieve the specific VM.

    .. code-block:: python
      
     base_url = "https://" + ip + ":9440/api/nutanix/v3/vms"
     url = base_url + "/list"
     headers = {'Accept': 'application/json', 'Content-Type': 'application/json'}
     url_method = "POST"

     r = process_request(url, url_method, user, password, headers, json.dumps(payload))
     print "Response Status: " + str(r.status_code)
     vm_list_json = r.json()
     for vm in vm_list_json['entities']:
      if vm['spec']: #sometimes this value will be '{}'
        if (vm['spec']['name'] == "@@{vmname}@@"):
          vm_json = vm   
      
#. Copy the contents into the escript.  This section manipulates the json contents to change to the new memory size and power off the VM.

    .. code-block:: python
      
     del vm_json['status']
     del vm_json['spec']['resources']['memory_size_mib']
     del vm_json['spec']['resources']['power_state']

     vm_json['spec']['resources']['memory_size_mib'] = @@{newMemSize}@@
     vm_json['spec']['resources']['power_state'] = "OFF"
     print "VM JSON: " + json.dumps(vm_json)
   

#. Copy the contents into the escript.  This section will put the new json specification to the Prism Central to execute the changes.  If Prism Central executed the changes successfully, it will return exit 0.  Otherwise, it is exit 1.

    .. code-block:: python
     
     url = base_url + "/" + str(vm_json['metadata']['uuid'])
     url_method = "PUT"
     r = process_request(url, url_method, user, password, headers, json.dumps(vm_json))
     print "Response Status: " + str(r.status_code)
     print "Response: ", r.json()
     if (r.ok):
      sleep(120)
      exit(0)
     else:  
      exit(1)  
   

#. Launch the Blueprint.  

   .. figure:: images/launch_app.png

#. Click on the **Audit** tab of the application.   Expand the **Create**

   .. figure:: images/app_success.png

#. Observe the section on the **Update Memory**

   .. figure:: images/audit_update_memory.png

#. Go to **Virtual Infrastructure->VMs**

   .. figure:: images/pc_vm.png

#. Drill into **CentosVM**

   .. figure:: images/centos_vm.png


Operation 3: Power on the VM
............................

#. Create another task to power up the VM.  

#. Fill up the contents of the escript based on the learning till date.

#. The end result is the memory of the VM was changed and powered on.



.. |blueprint-icon| figure:: images/blueprint_icon.png
