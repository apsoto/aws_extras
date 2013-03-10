# AWS_EXTRAS

Chef cookbook with some useful recipes for managing Amazon Web Services components

## Recipes

### aws_extras::swap

Only m1.small instance types have swap, therefore this recipe creates a
swap file at /mnt/swapfile equivalent to system memory.

### aws_extras:ec2_metadata

Installs the [ec2-metadata](http://aws.amazon.com/code/1825) script.


## History
* 1.1     Updated ec2-metadata script
* 1.0     Initial release
