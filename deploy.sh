flutter pub get
flutter build web
mv docs/CNAME CNAME
rm -rf docs
# docs is set as source folder for GitHub Pages in repository's Settings
mv build/web docs
mv CNAME docs/CNAME
git add *
git commit -am "deploy"
git push
# GitHub Actions deploys website after that
# https://github.com/ivribalko/ivribalko.github.io/actions
