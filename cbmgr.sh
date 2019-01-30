#timestamp function
#timestamp() {
 # date +"%T"
#}

# do something...
#mkdir $timestamp # print timestamp
# do something else...
#mkdir $timestamp # print another timestamp
# continue...
backup=cbmgr$(date +%Y-%m-%d_%H-%M-%S)
couchbasemanager=/backup/data_backup/cb_backupmgr/$backup
mkdir -p $couchbasemanager
cd $couchbasemanager
#docker exec prisma-db /usr/bin/mysqldump -u root --password=graphcool las-be@elesson > $(date +%Y-%m-%d_%H-%M-%S).sql
/opt/couchbase/bin/cbbackupmgr config --archive $couchbasemanager  --repo cb_live_$backup
/opt/couchbase/bin/cbbackupmgr backup -a  $couchbasemanager -r cb_live_$backup -c couchbase://localhost -u dev -p 123456
zip -r cb_$backup.zip ./
GLOBIGNORE=*.zip
rm -irf ./*
