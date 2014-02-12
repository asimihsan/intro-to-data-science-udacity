Exec {
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/ruby/bin/",
    logoutput => "on_failure",
}

# Keep box time up to date.
class { '::ntp': }

# Always update packages every time you "vagrant up".
class { 'apt':
    always_apt_update   =>  true,
}

# Install Python and development headers, for building modules.
include python

# Install LaTeX for IPython Notebook.
# Install ZeroMQ for IPython Notebook (pyzmq module).
# Install Pandoc so that you can use "ipython nbconvert"
# Install libpng and libfreetype6-dev for IPython.
# Install gfortran/libatlas/libjpeg/libxml2 for numpy.
# Install libhdf5-* and hdf5-tools for PyTables, in turn for pandas
$packages = [
    "build-essential",
    "gfortran",
    "hdf5-tools",
    "libagg-dev",
    "libatlas-base-dev",
    "libatlas3gf-base",
    "libblas-dev",
    "libblas-doc",
    "libblas3gf",
    "libcr-dev",
    "libfreetype6-dev",
    "libhdf5-mpich-dev",
    "libhdf5-serial-dev",
    "libjpeg-dev",
    "liblapack-dev",
    "liblapack-doc",
    "liblapack3gf",
    "libncurses5",
    "libncurses5-dev",
    "libpng-dev",
    "libxml2-dev",
    "libzmq3",
    "libzmq3-dbg",
    "libzmq3-dev",
    "mpich2",
    "mpich2-doc",
    "pandoc",
    "pkg-config",
    "subversion",
    "texlive",
]
# Add apt repo to be able to install ZeroMQ
apt::ppa { 'ppa:chris-lea/zeromq': }
->
package {
    $packages: ensure => installed;
}

# statsmodels and PyTables are very naughty! If you attempt to put it
# into a requirements file without these dependencies it barfs.
exec { "pip install numpy":
    require => [Class["python"], Package[$packages]],
    timeout => 0,
}
->
exec { "pip install scipy":
    require => [Class["python"], Package[$packages]],
    timeout => 0,
}
->
exec { "pip install pandas":
    require => [Class["python"], Package[$packages]],
    timeout => 0,
}
->
exec { "pip install patsy":
    require => [Class["python"], Package[$packages]],
    timeout => 0,
}
->
exec { "pip install numexpr":
    require => [Class["python"], Package[$packages]],
    timeout => 0,
}
->
exec { "pip install cython":
    require => [Class["python"], Package[$packages]],
    timeout => 0,
}
->
exec { "pip install -r /vagrant/vagrant/puppet/requirements.txt":
    require => [Class["python"], Package[$packages]],
    timeout => 0,
}
