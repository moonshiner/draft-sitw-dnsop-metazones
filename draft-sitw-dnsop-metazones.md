%%%
title = "DNS Metazones"
abbrev = "metazones"
docName = "@DOCNAME@"
category = "info"
obsoletes = []
ipr = ""
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

 This document describes a method for automatic zone catalog
 provisioning and synchronization among DNS primary and secondary
 nameservers by storing and transferring the catalogs as regular DNS
 zones.

{mainmatter}

# Introduction

 DNS nameservers implement AXFR and IXFR for zone data synchronization
 among a zone's primary its and secondary nameservers, but the list of
 zones served by the primary (called a catalog in [RFC1035]) is not
 automatically synchronized.  The administrator of a DNS nameserver
 farm has to manually, or via an external application layer,
 synchronize such zone catalogs among primaries and their secondary
 nameservers.  This can be inconvenient, error-prone and dependent on
 the nameserver implementation.

 A method for automatic zone catalog provisioning and synchronization
 is useful, so that the zone catalog can be maintained in a reference
 location by an administrator, similar to zone data.

 This document describes one such method, in which the catalog is
 represented as a regular DNS zone called a "catalog zone", and
 transferred using DNS zone transfers.  The representation of catalogs
 within DNS zones is specified and nameserver requirements are listed
 so that DNS implementations can support catalog zones.

 The contents and representation of catalog zones are described in
 Section 2.  Nameserver behavior is described in Section 3.  A
 glossary of some terms used in this memo is provided in Appendix A.

{backmatter}
