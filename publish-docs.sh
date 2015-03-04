sitepath=`pwd`
contentpath="../skinny"

if [ "$1" != "" ]; then
    contentpath=$1
fi

echo "Writing site from $contentpath to $sitepath"

cd $contentpath

if [ $? != 0 ]
then
	echo "Content directory $contentpath could not be found: exiting."
    exit $?
fi

#switch the content to the master branch
git checkout master

if [ $? != 0 ]
then
	echo "Could not checkout master branch, probably uncommitted changes: exiting."
    exit $?
fi

#generate the dist
grunt build

if [ $? != 0 ]
then
	echo "Grunt build failed for skinny.js: exiting."
    exit $?
fi

cd $sitepath

# Build the site
grunt

if [ $? != 0 ]
then
	echo "Grunt build failed for skinny site: exiting."
    exit $?
fi

# Go back to skinny, where the gh-pages branch is.
# We need to put the site there
cd $contentpath
git checkout gh-pages

if [ $? != 0 ]
then
	echo "Could not checkout gh-pages branch, probably uncommitted changes: exiting."
    exit $?
fi

# Clear the directory of anything that could cause a conflict
git fetch origin
git reset --hard origin/gh-pages

cp -R $sitepath/site/_site/* .

git add -A
git commit -m "Updating documentation"

if [ $? != 0 ]
then
    exit $?
fi

git push

if [ $? != 0 ]
then
    exit $?
fi

git checkout master