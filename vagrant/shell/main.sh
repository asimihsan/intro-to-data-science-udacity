#!/usr/bin/env bash

PATH=/opt/ruby/bin:/usr/local/bin:$PATH

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR=/etc/puppet/

$(which gem > /dev/null 2>&1)
FOUND_GEM=$?
if [ "$FOUND_GEM" -ne '0' ]; then
  echo 'Attempting to install ruby environment.'
  $(which apt-get > /dev/null 2>&1)
  FOUND_APT=$?
  $(which yum > /dev/null 2>&1)
  FOUND_YUM=$?

  if [ "${FOUND_YUM}" -eq '0' ]; then
    yum -q -y makecache
    yum -q -y install ruby ruby-devel rubygems
    echo 'git installed.'
  elif [ "${FOUND_APT}" -eq '0' ]; then
    apt-get -q -y update
    apt-get -q -y install ruby ruby-dev rubygems
    echo 'ruby environment installed.'
  else
    echo 'No package installer available. You may need to install ruby environment manually.'
  fi
else
  echo 'git found.'
fi

# NB: librarian-puppet might need git installed. If it is not already installed
# in your basebox, this will manually install it at this point using apt or yum

$(which git > /dev/null 2>&1)
FOUND_GIT=$?
if [ "$FOUND_GIT" -ne '0' ]; then
  echo 'Attempting to install git.'
  $(which apt-get > /dev/null 2>&1)
  FOUND_APT=$?
  $(which yum > /dev/null 2>&1)
  FOUND_YUM=$?

  if [ "${FOUND_YUM}" -eq '0' ]; then
    yum -q -y makecache
    yum -q -y install git
    echo 'git installed.'
  elif [ "${FOUND_APT}" -eq '0' ]; then
    apt-get -q -y update
    apt-get -q -y install git
    echo 'git installed.'
  else
    echo 'No package installer available. You may need to install git manually.'
  fi
else
  echo 'git found.'
fi

if [ ! -d "$PUPPET_DIR" ]; then
  mkdir -p $PUPPET_DIR
fi
cp /vagrant/vagrant/puppet/Puppetfile $PUPPET_DIR

$(which puppet > /dev/null 2>&1)
FOUND_PUPPET=$?
if [ "$FOUND_PUPPET" -ne '0' ]; then
  gem install puppet
fi

if [ "$(gem search -i librarian-puppet)" = "false" ]; then
  echo 'install librarian-puppet gem'
  gem install librarian-puppet
  cd $PUPPET_DIR && librarian-puppet install --clean
else
  cd $PUPPET_DIR && librarian-puppet update
fi

if [ "$(gem search -i rgen)" = "false" ]; then
  echo 'install rgen gem'
  gem install rgen
fi
