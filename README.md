docker-git-ftp
==============

A minimal Alpine Linux docker image with the latest
[git-ftp](https://github.com/git-ftp/git-ftp) suited for automated deployments
via Continuous Delivery systems like GitLab Pipelines.

Automatically build upon pushes to the master branch:
https://hub.docker.com/r/dotsunited/git-ftp

### Usage

Example `.gitlab-ci.yml` configuration:

```yml
deploy:
    image: dotsunited/git-ftp
    stage: deploy
    only:
        - master
    script:
        - git ftp push -vv --syncroot web/ --user $FTP_DEPLOY_USER --passwd $FTP_DEPLOY_PASSWORD $FTP_DEPLOY_HOST
```

License
-------

Copyright (c) 2017 Dots United GmbH.
Released under the [MIT](LICENSE) license.
