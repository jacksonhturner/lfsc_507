### Speed up orthology inference by removing paralogous genes within taxa

* Use DIAMOND to identify paralogous genes by running a blastp search of an annotated assembly against itself
* Use a custom python script to remove genes with multiple matches
* Speed up orthology inference by excluding known paralogs
* Expected to be especially effective in plants and fungi with histories of duplication events
* More to come!
