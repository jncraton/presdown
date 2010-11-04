.PHONY: all all-before all-after clean
all: all-before presdown/PresDown.py all-after

clean:
	rm presdown/*

presdown/PresDown.py: src/PresDown.py src/slides.css src/slides.js
	touch presdown/__init__.py
	cat src/PresDown.py > presdown/PresDown.py
	echo "css = r'''" >> presdown/PresDown.py
	cat src/slides.css >> presdown/PresDown.py
	echo "'''" >> presdown/PresDown.py
	echo "js = r'''" >> presdown/PresDown.py
	cat src/slides.js >> presdown/PresDown.py
	echo "'''" >> presdown/PresDown.py
	echo "template = Template(r'''" >> presdown/PresDown.py
	cat src/template.html >> presdown/PresDown.py
	echo "''')" >> presdown/PresDown.py