# Falco Action

Run [Falco](https://github.com/falcosecurity/falco) in a GitHub Action to detect suspicious behavior in your CI/CD workflows. 

This GitHub Action can be used to monitor your GitHub runner and detect Software Supply Chain attacks.

The repository contains two GitHub Actions:
- The [start](start/action.yaml) action is used to start a [Sysdig](https://github.com/draios/sysdig) file
- The [stop](stop/action.yaml) action is used to stop Sysdig and run Falco on the recorded capture file get visibility on the steps of your GitHub Actions job

As a result, you will get a summary of what happened in the [job summary](https://github.blog/news-insights/product-news/supercharging-github-actions-with-job-summaries/). 

The job summary will give you information about:
- Falco rules triggered during steps' execution. The Falco event timestamp are correlated to the start and end time of each step. This aims at giving an understanding of where the suspicious behavior was noticed to help with remediation process.
- Contacted IPs
- Contacted DNS domains
- SHA256 hash of spawned executables
- Spawned container images
- Written files

## Usage

### Start

```yaml
- uses: falcosecurity/action/start@<commit-sha>
  with:
    # Config file. This file can be used to exclude
    # - file and folders
    # - processes
    # - IPs
    # - syscalls
    # from the events generated by the job. This file can be used to tune the Falco alerts,
    # clean-up the profile information. See the default config file in 
    config_file: path/to/config_file
```

### Stop

```yaml
- uses: falcosecurity/action/stop@<commit-sha>
  with:
    # Specify a custom rule file to be used when running Falco. This file can contains rules
    # that might be relevant to the user that are not included in the default Falco rules.
    custom_rule_file:
    # The directory where to save profile information. All the profile PRs will be opened against
    # this directory. todo: randomize branch name to open PRs when needed.
    profile_dir:
    # Whether to save the capture file remotely on an S3 bucket or not.
    # todo: finish this feature, secret managment etc.
    save_capture:
```

## Scenario
```
```

