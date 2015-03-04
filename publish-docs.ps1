$sitepath=pwd
$contentpath="../skinny"

# Point to Ruby 2. 
# TODO: Find a way to make this portable.
$env:PATH = "C:\Ruby200-x64\bin;$($env:PATH)"

if ($LASTEXITCODE -ne  0)
{
    exit
}

echo "Writing site from $contentpath to $sitepath"

pushd $contentpath

if ($LASTEXITCODE -ne  0)
{
	echo "Content directory $contentpath could not be found: exiting."
    exit
}

#switch the content to the master branch
git checkout master

if ($LASTEXITCODE -ne  0)
{
	echo "Could not checkout master branch, probably uncommitted changes: exiting."
    exit
}

#generate the dist
grunt build

if ($LASTEXITCODE -ne  0)
{
	echo "Grunt build failed for skinny.js: exiting."
    exit
}

pushd $sitepath

# Build the site
grunt

if ($LASTEXITCODE -ne  0)
{
	echo "Grunt build failed for skinny site: exiting."
    exit
}

# Go back to skinny, where the gh-pages branch is.
# We need to put the site there
pushd $contentpath
git checkout gh-pages


if ($LASTEXITCODE -ne  0)
{
	echo "Could not checkout gh-pages branch, probably uncommitted changes: exiting."
    exit
}

# Clear the directory of anything that could cause a conflict
git fetch origin
git reset --hard origin/gh-pages

cp $sitepath/site/_site/* . -recurse -force

git add -A
git commit -m "Updating documentation"

if ($LASTEXITCODE -ne  0)
{
    exit
}

git push

if ($LASTEXITCODE -ne  0)
{
    exit
}

git checkout master

popd
popd
popd