URL := http://172.17.0.1.nip.io/
TOKEN := runner_token

register:
	cp config/ci.base.template.toml config/config.toml

	docker compose run --rm ci register \
		--non-interactive \
		--url "$(URL)" \
		--registration-token "$(TOKEN)" \
		--executor "docker" \
        --docker-image busybox \
		--description "AWS-autoscaled CI Runner" \
		--run-untagged="true" \
		--template-config "/etc/gitlab-runner/ci.standard.template.toml"

	docker compose run --rm ci register \
		--non-interactive \
		--url "$(URL)" \
		--registration-token "$(TOKEN)" \
		--executor "docker" \
        --docker-image busybox \
		--description "AWS-autoscaled CI Runner (Docker)" \
		--run-untagged="false" \
		--tag-list "docker" \
		--template-config "/etc/gitlab-runner/ci.privileged.template.toml"