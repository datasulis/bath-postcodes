Simple scripts to query and generate a list of BANES postcodes from the Ordnance Survey Linked Data

INSTALL
-------

The project has very simple dependencies relying on core libraries plus the JSON gem:

	sudo gem install json

USAGE
-----

To download and cache all the relevant files run:

	rake download

The data is all stored in the data sub-directory of the project.

LICENSE
-------

The code in this project is hereby released into the Public Domain. 

To view a copy of the public domain dedication, visit 
http://creativecommons.org/licenses/publicdomain or send a letter to 
Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.

The data archived in the `data` directory is published under the [OS Open Data Licence](http://www.ordnancesurvey.co.uk/oswebsite/docs/licences/os-opendata-licence.pdf)
