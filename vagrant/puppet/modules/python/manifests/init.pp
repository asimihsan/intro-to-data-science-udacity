class python {

    Exec { path => "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin", }

    $python_dev = $operatingsystem ? {
        ubuntu => "python-dev",
        /(centos|redhat|oel)/ => "python-devel",
    }

    package {
        "python": ensure => installed;
        $python_dev: ensure => installed;
        "curl": ensure => installed;
    }

    exec { "install_distribute_from_scratch":
        command => "curl -L https://bitbucket.org/pypa/setuptools/downloads/ez_setup.py | python",
    }

    exec { "install_pip_from_scratch":
        require => Exec["install_distribute_from_scratch"],
        command => "curl -L https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python",
    }

    exec { "install_setuptools_from_scratch":
        require => Exec["install_pip_from_scratch"],
        command => "pip install --force --upgrade setuptools",
    }
}
