Poor-Mans-High-Availability
===========================

This playbook is a basic collection of settings for running a two node
*cluster* with some basic failover mechanisms on
[DigitalOcean (referral)](https://m.do.co/c/dd5d931d13ce). The basic idea is to
run two CouchDB databases in Master<->Master replication and two Solr Nodes
that would listen to the local CouchDB copy.

[GlusterFS](http://www.gluster.org/) is used for shared storage, and
[Thumbor](http://thumbor.org/) creates thumbnails. Internal Communication
between nodes is done via private networking within digital ocean using
[tinc](http://tinc-vpn.org/).

Both nodes are using a DigitalOcean Floating IP that is assinged to one of
them. Corosync/Pacemaker is used to automatically switch them in case of
failure on the master. Nginx can be used to route the traffic to both nodes.

This is a stripped down version of my in-production so YMMV (a lot actually).
Take everything with a grain of salt!


Requirements
------------

This requires Ansible 2.x. Also, in real life you want to encrypt the
`group_vars/*` and `host_vars/*` using `ansible-vault`.


License
-------

The WTFPL.
