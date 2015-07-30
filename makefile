test:
	for f in `find . -name \*.pm` ; do perl -I /usr/lib/os-autoinst -I ./lib -c $$f 2>&1 | grep -v " OK$$" && exit 2; done ; true && echo "Check OK!"
