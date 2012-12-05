## ET-Model landing page

This is a landing page with links to QI models and another general information such as: press releases, partners, disclaimer, privacy statement, and information about QI.

About, Disclaimer, and Privacy statement are static pages that are stored in *db/static_pages*

Information about partners is stored in *config/partners* in *.yml files. 

Information about press releases is stored in *config/press_releases* in *.yml files. Corresponding pdf's are stored on Amazon S3.

### Adding partners

In order to add a new partner record a text file with extension .yml should be added into the folder *config/partners*. Name of the file should be unique (it should be name or a short name of the partner).
Format of the file (based on the example shell.yml):

> key: Shell  
> url: http://www.shell.com  
> country: Global  
> name: Shell  
> type: general  
> description\_en: very short description  
> description\_nl: kleine beschrijving

Where *type* can be general, knowledge or education.
There should be no space in the beginning of any line.

### Adding press releases

In order to add a new press release a text file with extension .yml should be added into the folder *config/press_releases*. Name of the file should be unique and it should be formatted as release\-date\_medium.yml (e.g., 2012-04-24_Duurzaamnieuws.nl.yml).
Format of the files is:

> id: 2  
> release\_type: article  
> file\_name: 2012-04-24_Duurzaamnieuws.nl.pdf  
> medium: Duurzaamnieuws.nl  
> release\_date: 2012-04-24  
> title: VVD wil vier nieuwe kerncentrales  

Where *id* is a unique integer.
File\_name is the name of the corresponding file that is stored on Amazon S3. 