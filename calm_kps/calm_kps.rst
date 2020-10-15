.. _calm_kps:

-------------------------------------
Karbon Platform Service
-------------------------------------

*The estimated time to complete this lab is 60 minutes.*

Pre-requisite:
++++++++++++++

#.  This course assumes the trainees have basic knowledge of Karbon Platform Service

#.  **Python** knowledge would be an added advantage but not essential.

#.  The Prism Central must be connected to Internet



Product Configuration
+++++++++++++++++++++

#. Prism Central: pc.2020.8.0.1

#. Karbon Platform Service

Create Service Domain in Karbon Platform Service
++++++++++++++++++++++++++++++++++++++++++++++++

#.	In Prism Central, click on Setting.  Ensure 8.8.8.8 was set in the name server.

  .. figure:: images/PC_Internet.png

#.  In Prism Central, create a Service Domain VM with the following VM specification.

  .. figure:: images/002_sdvmconfig.png

#.  The disk image was downloaded from http://portal.nutanix.com 

  .. figure:: images/DiskImage.png

#.  Select the network.

  .. figure:: images/003_sdvmimg.png

#. Power up the VM.  Note down the IP address for the Service Domain VM.  Run this url in the browser.  Copy the serial no.

  code-block:: bash

    http://<Service Domain VM>:8080/v1/sn

   .. figure:: images/sn.png

#.  Open a browser and key in https://karbon.nutanix.com.  Login to Karbon Platform Service.   

   .. figure:: images/KPS_Login.png


#. Click on **Add Service Domain**

   .. figure:: images/addsd.png

#. Fill in the information to create a single node service domain

   .. figure:: images/single-node-sd.png

#. Scroll down.  Use the serial no to fill in the details.

  .. figure:: images/Node-SN.png

#. Click on Next.

  .. figure:: images/SD2.png

#.  Wait for 15 to 30 mins for Karbon Platform Service to install.  The status would change to Un-Healthy and subsequently Healthy.

  .. figure:: images/SDRegistered.png

