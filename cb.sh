#timestamp function
#timestamp() {
 # date +"%T"
#}

# do something...
#mkdir $timestamp # print timestamp
# do something else...
#mkdir $timestamp # print another timestamp
# continue...
backup=$(date +%Y-%m-%d_%H-%M-%S)
couchbase=/backup/data_backup/couchbase/$backup
mkdir -p $couchbase
cd $couchbase
#docker exec prisma-db /usr/bin/mysqldump -u root --password=graphcool las-be@elesson > $(date +%Y-%m-%d_%H-%M-%S).sql
/opt/couchbase/bin/cbbackup http://localhost:8091 $couchbase -b content  -u dev -p 123456
zip -r cb_$backup.zip ./
GLOBIGNORE=*.zip
rm -irf ./*
