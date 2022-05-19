########################################################################

# This file is part of the UNAM RATIR/RATTEL software.

# $Id: Makefile.in 3016 2017-12-07 05:25:27Z alan $

########################################################################

# Copyright © 2011 Alan M. Watson <alan@astroscu.unam.mx>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
# AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
# DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
# PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

########################################################################

HTMLS 			=	index.html \
				status.html \
				news-2022.html \
				news-2021.html \
				news-2020.html \
				news-2019.html \
				news-2018.html \
				contact.html \
				search.html \
				participants.html \
				publications.html \
				telescope.html \
				interim-instrument.html \
				gallery.html \
				acknowledgements.html \
				shared-risk-observations.html

EXTRA_HTML_DEPENDENCIES	=	HEADER.md FOOTER.md *.meta

all			: 	$(HTMLS)

install			:	all
	rsync -v --chmod=u=rwX,go=rX \
	  coatli.conf transientscu-services:/etc/apache2/sites-enabled/
	rsync -ahv --chmod=u=rwX,go=rX --delete \
	  --exclude=.git/ \
	  --include=./ \
	  --include=*/ \
	  --include=*.html \
	  --include=*.pdf \
	  --include=*.jpg \
	  --include=*.png \
	  --include=*.css \
	  --include=*.mp4 \
	  --exclude=* \
	  . transientscu-services:/usr/local/var/www/coatli/html

########################################################################

TOOLSDIR	=	./tools
include $(TOOLSDIR)/Makefile.tools
include ./Makefile.dependencies
