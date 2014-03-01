# intro-to-data-science-udacity

Repo for tools, tricks, and a virtual machine for "Intro to Data
Science" on Udacity

## How to setup and use a virtual machine

-   Install VirtualBox: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
-   Install Vagrant: [http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html)
-   Download this repository's contents to your machine. Either:
    1.   [Install Git](http://git-scm.com/downloads), then clone this repo to your computer: `git clone https://github.com/asimihsan/intro-to-data-science-udacity.git`, OR
    2.   [Download](https://github.com/asimihsan/intro-to-data-science-udacity/archive/master.zip) then extract a ZIP file of this repo.
-   Change directory to your clone: `cd intro-to-data-science-udacity`
-   From the root of the clone run: `vagrant up`
-   Check for errors. There should be none. A warning about the version
    of the Guest Additions is harmless.
-   SSH onto the box using: `vagrant ssh`.
-   For more basic information on using Vagrant refer to the official
    documentation: [http://docs.vagrantup.com/v2/getting-started/index.html](http://docs.vagrantup.com/v2/getting-started/index.html)
-   After starting the virtual machine you can run an IPython Notebook
    server by running the following inside the guest VM: `ipython
    notebook --ip 0.0.0.0 --pylab inline`. Then on your host machine
    browse to `http://localhost:58888`. Congratulations!

Using Vagrant you can also set up Amazon EC2 instances. See the 
following for more information: [https://github.com/mitchellh/vagrant-aws](https://github.com/mitchellh/vagrant-aws)

If you want to quickly share files on your local host machine with the
guest VM note that the root of this repository is mapped to `/vagrant`
within the guest VM. You could either copy files or use softlinks to
share host directories on your guest; both the host and guest can modify
files and both will see the changes.

### Using IPython Notebook from the VM on your host machine

When you run `ipython notebook` by default it starts an HTTP server on
port 8888 but only bound to the local loopback interface. In the VM you
must explicitly call `ipython notebook --ip 0.0.0.0` instead. Vagrant
will then attempt to map port 58888 on your host PC to port 8888 in the
guest PC. Try to browse to `http://localhost:58888` and you should be
able to access your IPython Notebook.
