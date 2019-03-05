### Create and delete instances

Create instance (also with added region):

    sudo gcloud compute instances create [INSTANCE_NAME] --zone [REGION_NAME] --metadata-from-file startup-script=[STARTUP_SCRIPT_PATH]

Delete instance:

    sudo gcloud compute instances delete [INSTANCE_NAME]

### Get settings for the already running instance

    sudo gcloud compute instances describe [INSTANCE_NAME]

### List instances currently running

    sudo gcloud compute instances list

### Example addition of ssh keys to the instance example 

    sudo gcloud compute instances add-metadata [INSTANCE_NAME] --metadata-from-file ssh-keys=/path/to/ssh_list

`ssh_list` file is formatted as follows and overwrites all the ssh keys already included in the instance:

    [USERNAME]:ssh-rsa [SSH_PUBLIC_KEY] [USERNAME_SSH]

### Initialise with a specific image

#### Get all the images that are currently available
    sudo gcloud compute image list 

#### Launch instance with Ubuntu 18.04
    sudo gcloud compute create [INSTANCE_NAME] --zone [REGION_NAME] --image-project ubuntu-os-cloud --image-family ubuntu-1804-lts

