FILES = `ls -1p | grep -iE -e ".*\.ya?ml" | xargs echo`

validate:
	@echo Action: Validate the configuration and spit it out.
	@esphome config $(FILES)
  ifeq (1,0)
  	echo "\nThere were validation errors. Please check logs for more details."
  	return 1
  endif
	@echo "\nValidation finished successfuly."
config: validate

compile:
	@echo Action: Read the configuration and compile a program.
	@esphome compile $(FILES)
build: compile
generate: compile

upload:
	@echo Action: Validate the configuration and upload the latest binary.
	@esphome upload $(FILES)
install: upload

run:
	@echo Action: Validate the configuration, create a binary, upload it, and start logs.
	@esphome run $(FILES)
start: run

clean:
	@echo Action: Delete all temporary build files.
	@esphome clean $(FILES)
