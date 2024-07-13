---
sidebar_position: 40
---

# Powershell

- count number of lines of all *.py files

``` powershell
dir -include *.py -Recurse | % { $count = (gc $_ | ? { $_ }).count; $countg = $countg + $count; if($countg) {write-host "$_ `tcount: $countg"} }
```
