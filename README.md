# hugo-firebase-docker

Docker Images with hugo and firebase-cli installed

# Using on Gitlab CI

Here the example of `.gitlab-ci.yml` for Hugo `0.101.0`:

```yaml

variables:
    GIT_SUBMODULE_STRATEGY: recursive
    GIT_SSL_NO_VERIFY: "true"

stages:
    - deploy

deploy:
    stage: deploy
    image: isenganime/hugofirebase
    script:
        # build site
        - cd ${CI_PROJECT_DIR}
        - hugo
        # upload
        - firebase deploy --only hosting --token ${FIREBASE_TOKEN}
    only:
        - master

```
