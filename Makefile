# define the name of the venv
VENV := venv

# default target, when executed without any args
all: venv 


$(VENV)/bin/activate: requirements.txt
	python3 -m venv $(VENV)
	./$(VENV)/bin/pip install -r requirements.txt
	./$(VENV)/bin/pip list	

# venv is a shortcut target
venv: $(VENV)/bin/activate

format: venv
	./$(VENV)/bin/black .

run: venv
	./$(VENV)/bin/python app.py

clean:
	rm -rf $(VENV)
	find . -type f -name '*.pyc' -delete

.PHONY: all venv format run clean 

