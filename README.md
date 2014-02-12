# intro-to-data-science-udacity

Repo for tools, tricks, and a virtual machine for "Intro to Data
Science" on Udacity

## How to setup and use a virtual machine

-   Install VirtualBox: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
-   Install Vagrant: [http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html)
-   Clone this repo to your computer: `git clone git@github.com:asimihsan/intro-to-data-science-udacity.git`
-   From the root of the clone run: `vagrant up`
-   Check for errors. There should be none. A warning about the version
    of the Guest Additions is harmless.
-   SSH onto the box using: `vagrant ssh`.
-   For more basic information on using Vagrant refer to the official
    documentation: [http://docs.vagrantup.com/v2/getting-started/index.html](http://docs.vagrantup.com/v2/getting-started/index.html
-   After starting the virtual machine you can run an IPython Notebook
    server by running: `ipython notebook --ip 0.0.0.0 --pylab inline`.
    Then on your host machine browse to `http://localhost:58888`.
    Congratulations! 

Using Vagrant you can also set up Amazon EC2 instances. See the 
following for more information: [https://github.com/mitchellh/vagrant-aws](https://github.com/mitchellh/vagrant-aws)

## Using IPython Notebook

When you run `ipython notebook` by default it starts an HTTP server on
port 8888. Vagrant will thebn attempt to map port 58888 on your host PC
to port 8888 in the guest PC. Try to browse to `http://localhost:58888`
and you should be able to access your IPython Notebook.
