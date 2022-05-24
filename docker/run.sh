DATA_DIR=/data
CLOUDERA_ANSIBLE=cloudera.cluster
cd $CLOUDERA_ANSIBLE && ansible-playbook -i $DATA_DIR/inventory_static.ini --extra-vars @$DATA_DIR/extra_vars.yml --extra-vars @$DATA_DIR/secrets.yml --extra-vars @$DATA_DIR/cluster.yml site.yml -vvv
