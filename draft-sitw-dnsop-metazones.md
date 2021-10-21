%%%
title = "DNS Metazones"
abbrev = "metazones"
docName = "@DOCNAME@"
category = "info"
obsoletes = []
ipr = "trust200902"
area = ""
workgroup = "DNSOP"
submissiontype = "independent"
keyword = [""]

[seriesInfo]
name = "Internet-Draft"
value = "@DOCNAME@"
stream = "independent"
status = "informational"

[[author]]
initials = "S."
surname = "Instenes"
fullname = "Shawn Instenes"
role = "editor"
  [author.address]
  email = "shawn@instenes.com "

[[author]]
initials = "T."
surname = "Wicinski"
fullname = "Tim Wicinski"
role = "editor"
  [author.address]
  email = "tjw.ietf@gmail.com"
  [author.address.postal]
  city = "Elkins"
  region = "WV"
  code = "26241"
  country = "USA"


%%%

.# Abstract

 This document describes a method for zone catalog
 provisioning and updating among DNS primary and secondary
 nameservers by storing and transferring the catalogs as regular DNS
 zones.

{mainmatter}

# Introduction

  [RFC1035] describes a "catalog" as a data structure that lists the zones 
  and where the zone data can be located. DNS zone data is currently 
  synchronize between primary and secondary nameservers using existing DNS
  protocols AXFR [RFC5936] and IXFR [RFC1995].  The configuration of these
  synchronization methods currently happen outside of the DNS and involve
  adhoc processes. 

 A method for managing zone catalog provisioning and synchronization in a 
 similiar method as DNS zone data, can be useful to administrators. 
 While the initial concept of a catalog is a list of zones, and zone data pointers,
 nameserver deployments have grown more complex over time. There is a need to
 manage multiple "catlogs" of distinct zones, as well as describing individual 
 properties of a zone, such as allowing zone transfers, queries, etc. 

 This document describes one such method, in which this management information 
 is represented as a regular DNS zone called a "metazone", and
 transferred using DNS zone transfers.  The representation of this data 
 within DNS zones is specified and nameserver requirements are listed.

# Metazones

## Description

  [Start here with describing zone data]

## Resource Records

### APL


### PTR

  Used for attributes 

### Use of DNAME

 
 Example:

  ```
    version.west 3600 IN CNAME version.metazone.local.
    masters.west 3600 IN APL 1:228.9.219.253/32
    allow-query.west 3600 IN APL 1:10.1.0.0/16 1:10.2.0.0/16
    90.105.235.189 3600 IN DNAME west.metazone.local.
    121.141.185.129 3600 IN DNAME west.metazone.local.
    54.235.179.68 3600 IN DNAME west.metazone.local.
    159.228.89.78 3600 IN DNAME west.metazone.local.
    zone-list.west 3600 IN TXT "zones bridge_zones edge_zones"
    default-forward.west 3600 IN TXT "True"
    default-forward-list.west 3600 IN APL 1:10.115.35.242/32 1:63.26.3.163/32 1:97.167.62.214/32 1:66.193.84.92/32
    notify.west 3600 IN TXT "True"
    also-notify-list.west 3600 IN APL 1:10.115.35.242/32 1:63.26.3.163/32 1:97.167.62.214/32 1:66.193.84.92/32
    local-bridge.west 3600 IN APL 1:126.90.129.146/32
  ```


{backmatter}
