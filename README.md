docker-git-ftp
==============

A minimal Alpine Linux docker image with the latest
[git-ftp](https://github.com/git-ftp/git-ftp) suited for automated deployments
via Continuous Delivery systems like GitLab Pipelines.

Automatically build upon pushes to the master branch:
https://hub.docker.com/r/dotsunited/git-ftp

Usage
-----

Example `.gitlab-ci.yml` configuration:

```yml
deploy_production:
  image: dotsunited/git-ftp
  stage: deploy
  environment:
    name: production
    url: https://example.com
  only:
    - master
  script:
    - git ftp push -v --syncroot public/ --user $FTP_DEPLOY_USER --passwd $FTP_DEPLOY_PASSWORD $FTP_DEPLOY_HOST
```

Make sure, you configure the `$FTP_DEPLOY_USER`, `$FTP_DEPLOY_PASSWORD` and
`$FTP_DEPLOY_HOST` variables in the CI/CD settings on GitLab.

License
-------

Copyright (c) 2017-2018 Dots United GmbH.
Released under the [MIT](LICENSE) license.
