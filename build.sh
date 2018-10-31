
#remove outputs
rm -r output
mkdir output
mkdir output/nb-redis
mkdir output/nb-taskengine
mkdir output/nb-rabbitmq
mkdir output/nb-mongodb
mkdir output/nb-elasticsearch

#build images
echo "---------------build ./nb-redis---------------"
cd nb-redis
docker image build -t cg2-linux-asg/redis -f Dockerfile .
docker tag cg2-linux-asg/redis:latest 041444721655.dkr.ecr.us-east-1.amazonaws.com/cg2-linux-asg/redis:latest

#docker push 041444721655.dkr.ecr.us-east-1.amazonaws.com/cg2-linux-asg/redis:latest


cp readme ../output/nb-redis/
cp -r conf ../output/nb-redis/

echo "---------------build ./nb-taskengine---------------"
cd ../nb-taskengine
docker image build -t cg2-linux-asg/task-engine -f Dockerfile .
docker tag cg2-linux-asg/task-engine:latest 041444721655.dkr.ecr.us-east-1.amazonaws.com/cg2-linux-asg/task-engine:latest

#docker push 041444721655.dkr.ecr.us-east-1.amazonaws.com/cg2-linux-asg/task-engine:latest

cp readme ../output/nb-taskengine/
cp -r conf ../output/nb-taskengine/


cd ..
echo "---------------build completed. ---------------"
echo "you find image tar files in current directory"

