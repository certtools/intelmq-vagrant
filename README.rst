==================================
Vagrant test VMs for intelmq-tests
==================================

(This is still very alpha...)

You will need `Vagrant <https://www.vagrantup.com/>`_ to run and provision the VMs.

Every VMs lives in a subdirectory which contains a ``Vagrantfile``.

The Vagrantfiles only differ by the definition of the base system.
Vagrant then uses the ansible playbook in the ``ansible`` folder to provision the VMs.

To run one of the VMs you enter the corresponding directory and run ``vagrant up``.
You can enter the VM using ``vagrant ssh``. Every VM exposes port ``80`` on the host port ``8080``.
You can halt the VM using ``vagrant halt``, you can destroy the VM by using ``vagrant destroy``.

The tests *should* be idempotent, so running ``vagrant provision`` after running ``vagrant up`` should not give another result.

There is a ``Makefile`` that runs ``vagrant up`` and ``vagrant destroy`` for everyone of the boxes and saves the output to logfiles.

Run scripts locally
-------------------

To run the ansible recipies without vagrant directly on the local machine, use:

    ansible-playbook --connection=local -i ansible/inventory.yml ansible/playbook.yml

stable CentOS or Debian 10 repos
--------------------------------

By default the repository tests the *unstable* repositories (base ``https://download.opensuse.org/repositories/home:/sebix:/intelmq/:unstable/``).
Set the environment variable ``intelmq_vagrant_test_stable=yes`` to test the *stable* repositories instead (base ``https://download.opensuse.org/repositories/home:/sebix:/intelmq/``).

Only implemented for CentOS and Debian 10.
