# JTExtensions
A collection of useful swift extensions to make iOS development more simple, intuitive and powerful

## Highlighting special comments as compiler Issues

Add the following code as a Run Script Build Phase using `/bin/bash`

```
TAGS="TODO:|FIXME:"
ERRORTAG="ERROR:"
find "${SRCROOT}" \( -name "*.h" -or -name "*.m" -or -name "*.swift" \) -print0 | xargs -0 egrep --with-filename --line-number --only-matching "($TAGS).*\$|($ERRORTAG).*\$" | perl -p -e "s/($TAGS)/ warning: \$1/" | perl -p -e "s/($ERRORTAG)/ error: \$1/"
```

This will allow TODO: or FIXME: comments to be highlighted in yellow as issues and ERROR: as a red warning (useful with #if conditional macros). See [here](http://krakendev.io/blog/generating-warnings-in-xcode) for more information.
