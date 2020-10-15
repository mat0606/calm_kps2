.. _calm_kubernetes:

-------------------------------------
Calm: Kubernetes
-------------------------------------

*The estimated time to complete this lab is 60 minutes.*

Pre-requisite:
++++++++++++++

#.  This course assumes the trainees have basic knowledge of Calm and understand the constructs in Calm.

#.  **Python** knowledge would be an added advantage but not essential.




Product Configuration
+++++++++++++++++++++

#.  pc.2020.8.0.1

#.  Calm 3.0.6 onward

#.  Calm Project & Environment Setup


Install Kubernetes from Calm Marketplace
++++++++++++++++++++++++++++++++++++++++

#.	Click on the Market Place.  Click on the Kubernetes icon  

   .. figure:: images/Marketplace-kubernetes.png

#. Click on **Launch**.

   .. figure:: images/Marketplace-launch.png

#. Select the project.  Click on **Launch**.

   .. figure:: images/Marketplace-select-project.png

#. Key in the name of the application.  Click on **Create**

   .. figure:: images/Calm-Launch.png

#. Wait for an estimated 15 mins.  The Kubernetes cluster was created successfully

   .. figure:: images/Application-successful.png

Retrieve the CA Client Certificate & Client Key in the Kubernetes Cluster
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#. Click on the Services.  Expand the no of Master Node.  Select the 1st Master Node.  Note down the Master IP address

  .. figure:: images/Application-service.png

#. In the Putty console, run this command to ssh into the K8S Master Node

  .. figure:: images/ssh_known_host.png

#. Run this command  
  
  .. figure:: images/kubeconfig.png

  .. literalinclude:: ls-kube.sh
  
#. Run this command to get the client certificate.  It was an example of the client certificate in my Kubernetes cluster.  The contents would be used later.
  
  .. literalinclude:: client-cert.sh
  
  ::

    -----BEGIN CERTIFICATE-----
    MIID1jCCAr6gAwIBAgIUH0mxkFlhFWeiD4jHBNn1PkgVsScwDQYJKoZIhvcNAQEL
    BQAwYzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExETAPBgNVBAcT
    CFNhbiBKb3NlMQ0wCwYDVQQKEwRrdWJlMQswCQYDVQQLEwJDQTEQMA4GA1UEAxMH
    a3ViZS1jYTAeFw0yMDEwMDUxMzExMDBaFw0yMTEwMDUxMzExMDBaMHAxCzAJBgNV
    BAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEX
    MBUGA1UEChMOc3lzdGVtOm1hc3RlcnMxEDAOBgNVBAsTB0NsdXN0ZXIxDjAMBgNV
    BAMTBWFkbWluMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuioOdCBy
    rs1dIDdSi6hgMeZzwJePrt+fBVgWDGhhu3vmVwqlOC4TO0ZbXmnwld1fRcAz0/gD
    zb6/PBpzAYZ0/9VVjWnfDAdVqxHUM4VCDHW3CBlUsPKwdO4ojKUS5KOUb5nsOgse
    xN6taCQx2bzVPbe+OktL1uiTwFKUWfk4t06BusX/M+aQO0Zb4wxRVbM7hkUt/Vrq
    dwZps6SLvdmLjHieGtBgAPDa8UON50VIM0zOM1uw4o/5isMbFrFhyDo3CDZresaK
    b5fR8xGOyAO7Bg5Gz6JcgJB5EUFVOZMofVn21tLNnQEnl92EK005suSUJK620277
    nHFIzJjcN8P3PwIDAQABo3UwczAOBgNVHQ8BAf8EBAMCBSAwEwYDVR0lBAwwCgYI
    KwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUpPMg8Zrj/9SR4KB1nw82
    FPlSTiIwHwYDVR0jBBgwFoAUv2DRV84bNnWcBCNdwZTeWgLwFpIwDQYJKoZIhvcN
    AQELBQADggEBAF+onhC7WgraRyv7PatJappFMQChYF6M/AcXbWoJDRlPpgeHZt1T
    0X+LpkJX0iwpwQ3pDrUG72mbscTml/LmsXcEL6nAzYyrkJaj/fxX6W9HXhTbs8Ik
    Q3HhTRUWXJSAMPtROUy2PhTk59KdLr5tAZMaPAkYkkSubD/voji4wqt2ikxTWsc7
    +yW0mZma15ASkzBMn5Xljn3pbuA3HRg3/mnY3p0B0HX8jBF2NmMyGqwJppLxIq+/
    9KZm7mDvGvhrFC6hTn4OCenbQKQlWd3/WyURsspoZ64Kx7ffI2fckeckkhdGM4rr
    VQsarb4SjeZkm5tlDl/vuR9drdfKmEZc+jA=
    -----END CERTIFICATE-----

#.  Run this command to get the client key.  It was an example of the client key in my Kubernetes cluster.  The contents would be used later.
  
  .. literalinclude:: client-key.sh
  
  ::

    -----BEGIN RSA PRIVATE KEY-----
	MIIEpAIBAAKCAQEAuioOdCByrs1dIDdSi6hgMeZzwJePrt+fBVgWDGhhu3vmVwql
	OC4TO0ZbXmnwld1fRcAz0/gDzb6/PBpzAYZ0/9VVjWnfDAdVqxHUM4VCDHW3CBlU
	sPKwdO4ojKUS5KOUb5nsOgsexN6taCQx2bzVPbe+OktL1uiTwFKUWfk4t06BusX/
	M+aQO0Zb4wxRVbM7hkUt/VrqdwZps6SLvdmLjHieGtBgAPDa8UON50VIM0zOM1uw
	4o/5isMbFrFhyDo3CDZresaKb5fR8xGOyAO7Bg5Gz6JcgJB5EUFVOZMofVn21tLN
	nQEnl92EK005suSUJK620277nHFIzJjcN8P3PwIDAQABAoIBABSesekk6u73qjf2
	SLtVVApS50FOyEhrVnbGEfMf4Kteht3fPPujBthK67XicBZ5ZaMZLeRtlSZF2XKz
	z0c8+FqZ65b1QhJYAaIoIGPwf6dXpoVMIPhUeT0KYA1r/1K516gg2Wx4bNkLfROK
	5saiRtBGONjGHElai3sC6pGorCKJa9IT7LxsfUd+dLebeKLamAXkXn4TkeSj67f1
	YIX2i/eoxOJAjnGBjiE3CMu7OlZEkMYDFwLjqNFYovEWZZwdub5+agMYQ/T//T1u
	OdGGqZjGQCgracaYbAEfghvmpgMpvPKXyfciFIRAdLTP+dNgGa++u+OTQOflsC8Y
	Z+lhgXECgYEA91cw5riakTwmsQjAUBYziwmQt6o64xeg9uQ0f6XqcHAoEnlCMCO0
	j0A5JoCtd2F7UVn35mascq3O3taZe7s1tCuL+TSNO6L8/QcZmV9T7W0eSIa9JIA7
	OW2UOsjQHP9rSPsxomSCfc2d2IcjOIc7pqriCfGle4m/0nWXh0fE93cCgYEAwK6R
	bzmfYHBNrszjkm3UuK/l7XmHOEerH1+1t4wrjiSTiGLD8abawt2Kj+4oKMrNv3uM
	4Cxx33zfNNGgZBNRic0/rTjZGUpeBhGL25pBKuW32fIDg8Dqr+isvhAa05DYEcGl
	u9oDmGRUTYplOtqwwS+5kuEuu88sC8WdmQJtAHkCgYEAguJoxi653FDwSI5Q9hBJ
	hjGxmv9B2hoO25c3ELVDsewnyF7SX5cFXSinFXDSWnIDR7FMNWfvqV/AMLtuzMLs
	UEMa9uyQMBa3uU2ghkCjsOglNkvWmxIgROtvnQvW1QF0TFJgmYaGZvv/oy0fvjIR
	psiWhJyS7SSflUcUwEmCOVECgYBQYMJEnsoQheiyEcChVfXWMXJ+NSMmZCdLiDaa
	4ftNaY6t512MEinR/m8OCbBxC+D2jwi+f2vlagcG1qfM944dKST2Eu/lr/M3Htyz
	+E5VIc0nOuEidjiwtyRQiRFXzmWESr7jdVfom3nbeu8ttQrlHA6S6iL/r7XVF1Pd
	/3gPKQKBgQD2OSbofzbhRCq+RUH3b9igZjEC+4lYy5dfkUG5GR/diw1eeksiPAD0
	8EZO4+Cai9UfeY49rGhHRbPa3/VC/rOCYzmPcklUKqKa6ixjv/Z2pz2wRoCb856K
	I6EU+ctuz4iFRLK6kXwXb7gV8QEgtJOS1/fj7nkUV7MvLvaot2VX2w==
	-----END RSA PRIVATE KEY----


Add a Kubernetes Provider in Calm
+++++++++++++++++++++++++++++++++

#. Click on Setting.  Click on Providers

  .. figure:: images/Calm_setting2.png

#. Click on +Add Provider

  .. figure:: images/Calm_provider.png

#. Key in the following: 1st Kubernetes Master Node IP address.

  .. figure:: images/K8S_provider.png

#. Scroll down and key in the following:

   - **Auth Type** - Certificate
   - **Client Certificate** - Paste the contents of the client certificate
   - **Client Key** - Paste the contents of the client key

  .. figure:: images/K8S_Provider_Contents.png

#. Click on **Save** and Verify

  .. figure:: images/Provider-Verification.png

Add the Kubernetes Provider to the Calm Project
...............................................

#. Click on **Project**.  Drill into your respective project

  .. figure:: images/Project.png

#. Click on **Select Provider**.  Select **Kubernetes**

  .. figure:: images/Project-Provider.png

#. Scroll down and click on **Save**.

  .. figure:: images/K8S_Added_To_Project.png


Deploy WordPress Application into Kubernetes Cluster
++++++++++++++++++++++++++++++++++++++++++++++++++++

Create a blueprint to deploy the Wordpress application
......................................................

#. Putty into the 1st Kubernetes Master Node IP address.  Create a secret named mysql-pass.  Run this command

  .. literalinclude:: create-secret.sh
  
  .. figure:: images/CreateSecret.png

#. Go to the blueprint.  Choose **Multi VM/Pod** Blueprint.

  .. figure:: images/MultiVM.png

#. Name the blueprint as Wordpress_User_Initial.  Choose your respective project.  Click on **Proceed**

  .. figure:: images/CreateBP.png

Create Variables in the blueprint
*********************************

#.  Click on the Application Profile->Default

  .. figure:: images/AppProfile.png

#.  On the right side of the screen, click on + to add a variable.  Add a variable named: namespace

  .. figure:: images/var_ns.png

#.  Click on **Show Additional Option**.  Scroll down and check on **Mark this variable mandatory**

  .. figure:: images/var_mandatory.png 

#.  Click on + to add another variable named: **MYSQL_PASSWORD**.  Check on **secret**.  Put the value as **Nutanix/4u**

  .. figure:: images/var_mysql.png

#.  Click on **Show Additional Option**.  Scroll down and check on **Mark this variable mandatory**

  .. figure:: images/var_mandatory.png 

Create the MySQL Pod
********************

#. Click on + to add a Pod

  .. figure:: images/new_pod.png

#.  Fill in the following.  Named it as **MYSQLAPP**.  It was important for the Pod Name to use this name because the subsequent yaml file would reference it.  Check on **Spec Editor**

  .. figure:: images/MYSQLAPP.png

#.  Click on **Edit**

  .. figure:: images/MYSQLAPP_Edit.png

#.  Click on “Pod Deployment Spec”.  Fill in the contents.

  .. figure:: images/MYSQLAPP-PodDeploy.png

  .. literalinclude:: MYSQLAPP-PodDeploy.sh
   

#. Click on the **container1**.  Fill in the contents.

  .. figure:: images/MYSQLAPP_Container.png

  .. literalinclude:: MYSQLAPP-Container.sh
    
#. Click on the Service Spec.  Fill in the contents.  Click on **Done**

  .. figure:: images/MYSQLAPP_Service.png

  .. literalinclude:: MYSQLAPP-Service.sh

      
 #.  Ensure the “Calm Published Service Name” is **MYSQLK8sPublishedService**.  It was important for the Service Name to use this name because the subsequent yaml file would reference it.

  .. figure:: images/MYSQLAPP-Service.png

#.  Click on **Save** to save the blueprint

Create the Wordpress pod
************************

#. Click on + to add a new pod

  .. figure:: images/new_pod.png

#. Named the pod: **WORDPRESSAPP**.  It was important for the Pod Name to use this name because the subsequent yaml file would reference it.  Check on **Spec Editor**.  Click on **Edit**. 

  .. figure:: images/WORDPRESSAPP.png 

#. Select the Pod Deployment Spec.  

  .. figure:: images/WORDPRESSAPP_Pod.png

  .. literalinclude:: WPAPP-Deploy.sh

#. Click on the **Container2**

  .. figure:: images/WORDPRESSAPP_Container.png

  .. literalinclude:: WPAPP-Container.sh
  
#. Click on the **Service** Spec

  .. figure:: images/WORDPRESSAPP_Service.png

  .. literalinclude:: WPAPP-Service.sh
 

#.  Click on **Save** to save the blueprint

Add Dependency to determine the sequence of execution
*****************************************************

#. The objective of the dependency was to define the sequence of execution.  Since the WordPress application was made up of both the application and mysql containers, the mysql container needs to be ready first.

#. Click on **Create Dependency** and link to MySQL as shown below

  .. figure:: images/Pod-Depend.png

#. Click on **Save** the blueprint

Launch the WordPress application into Kubernetes cluster
********************************************************

#.  Click on **Launch** to launch the blueprint

#.  Fill in the name and click on **Create**.

  .. figure:: images/LaunchWordPress.png

#. Wait for the application to be in **Running** State.

  .. figure:: images/WordPress_Running.png

Verify the Wordpress application
********************************

#.  Go to the Kubernetes application.  Expand the **Master**.  Choose the 1st Master Node.  Click on **Open Terminal**

  .. figure:: images/Wordpress_Service.png

#.  Run this command to ensure the **wordpress** and **wordpress-mysql** pods were started successfully

  .. figure:: images/WP_kubectl.png

#.  Run this command to identify the service for the wordpress application.

  .. figure:: images/WPSvc_kubectl.png

#.  Expand the Kubernetes worker node.  Note down the IP address

  .. figure:: images/Svc_Worker.png

#.  Open a new Chrome browser.  Key in the **Worker NodeIP address:NodePort** for wordpress.  In my example, it was http://10.38.207.64:32595.

  .. figure:: images/WP.png

Provision MetalLB into the Kubernetes Cluster
+++++++++++++++++++++++++++++++++++++++++++++

#.  The objective of this lab is to provision a MetalLB into the Kubernetes cluster.  The Wordpress application provisioned earlier did not have a public address.  It was using NodePort.  The subsequent Mountain Ranking Application was going to use LoadBalancer with public IP address.

#.  Click on the Calm MarketPlace Manager.  Drill into MetalLB.

  .. figure:: images/MarketPlaceMgr_MetalLB.png

#.  Add your project here.

  .. figure:: images/MetalLBJoinedProject.png

#.  Click on the Calm Market Place.  Click on MetalLB.

  .. figure:: images/MarketPlace-MetalLB.png

#.  Click on **Launch**

  .. figure:: images/MetalLB-launch.png

#.  Select your project.  Click on **Launch**

  .. figure:: images/MetalLB-Project.png

#.  Fill in the following:

  - **Name of the application** - 
  - **K8S Master Node IP ** - Find out the 1st Master Node IP address for your Kubernetes Cluster
  - **Start IP address** - Please check the IP address range was available before you defined the range.  Give a max of 3 IP address
  - **End IP address** - Please check the IP address range was available before you defined the range.

  .. figure:: images/MetalLB-launch2.png

#. The application was provisioned successfully.

  .. figure:: images/MetalLB-Succesful.png

#. Putty into the Kubernetes Master Node.  Run this command to ensure the MetalLB was installed successfully.

  .. figure:: images/kubectl-metallb.png
