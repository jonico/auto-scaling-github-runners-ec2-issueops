---
name: Create or edit self-hosted runner scale set
about: Create or edit a self-hosted runner scale set you can use for a workflow
title: Self-hosted runner scale set create/update request for <env here>
labels: 'self-hosted-runner-scale-set'

---

Issue created by this issue template will create or edit the necessary AWS configuration needed for a self-hosted runner scale set running in its own environment operated by [Philips Labs's AWS GitHub Runner](https://github.com/philips-labs/terraform-aws-github-runner).

Please insert the runner configuration values in the JSON below. It is advised but not mandatory that you create a runner group with the name of your environment first to control which repositories have access to your runner scale set.


**Because this setup is still running on a private credit card, please do not set the number of `maxRunners` per environment greater than 3.**

```json
{
  "environment": "<enter an environment name here>",
  "organization": "<enter a GitHub organization name here>",
  "minRunners": "1",
  "maxRunners": "3",
  "runnerGroup": "default",
  "amiFilter": "actions-runner-with-additional-packages-*",
  "amiOwner": "869946923544"
}
```

![image](https://user-images.githubusercontent.com/1872314/106927306-52228b80-6712-11eb-9cb8-11e91d719b9a.png)
