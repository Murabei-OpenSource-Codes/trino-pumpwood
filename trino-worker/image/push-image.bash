source version
git add ./*
git commit -m "Building a new version for Trino Worker container ${VERSION}"
git tag -a worker__${VERSION} -m "Building a new version for Trino Worker container ${VERSION}"
git push
git push origin worker__${VERSION}

docker push andrebaceti/trino-worker:${VERSION}
