DIR=`dirname $0`
cd $DIR
rm -rf docs
mdbook build 
mv book docs
git add *
git commit -m "$1"
git push origin master
