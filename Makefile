connect:
	@cd inventory; sed s/__SCALE__/$(CLUSTER)/g site.sed.input > site; cd ..
	ansible-playbook -i inventory/site playbooks/run.yml
