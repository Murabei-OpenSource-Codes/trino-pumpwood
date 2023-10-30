source version
git add ./*
git commit -m "Building a new version for trino-coordinator ${VERSION}"
git tag -a coordinator__${VERSION} -m "Building a new version for trino-coordinator ${VERSION}"
git push
git push origin coordinator__${VERSION}

docker push andrebaceti/trino-coordinator:${VERSION}
