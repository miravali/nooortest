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
mysql=/backup/data_backup/mysql/$backup
mkdir -p $mysql 
cd $mysql
docker exec prisma-db /usr/bin/mysqldump -R -u root --password=graphcool las-be@elesson > $(date +%Y-%m-%d_%H-%M-%S).sql
zip -r $backup.zip ./*.sql
rm -rf ./*.sql
