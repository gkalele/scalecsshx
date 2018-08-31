connect: csshx_check
	@rm -f inventory/site
	@cd inventory; sed s/__SCALE__/$(CLUSTER)/g site.sed.input > site; cd ..
	@mkdir -p keys
	ansible-playbook --syntax-check -i inventory/site playbooks/run.yml
	ansible-playbook -i inventory/site playbooks/run.yml

clean:
	@rm -f inventory/site
	@rm -f keys/*
	@rm -f tmp/csshx.*.config

csshx_check:
	@if ! [ -e /usr/local/bin/csshx ]; then brew install csshx; fi
