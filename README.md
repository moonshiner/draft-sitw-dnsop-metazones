```




DNSOP                                                   S. Instenes, Ed.
Internet-Draft                                                          
Intended status: Informational                          T. Wicinski, Ed.
Expires: 24 April 2022                                   21 October 2021


                             DNS Metazones
                     draft-sitw-dnsop-metazones-01

Abstract

   This document describes a method for zone catalog provisioning and
   updating among DNS primary and secondary nameservers by storing and
   transferring the catalogs as regular DNS zones.

Status of This Memo

   This Internet-Draft is submitted in full conformance with the
   provisions of BCP 78 and BCP 79.

   Internet-Drafts are working documents of the Internet Engineering
   Task Force (IETF).  Note that other groups may also distribute
   working documents as Internet-Drafts.  The list of current Internet-
   Drafts is at https://datatracker.ietf.org/drafts/current/.

   Internet-Drafts are draft documents valid for a maximum of six months
   and may be updated, replaced, or obsoleted by other documents at any
   time.  It is inappropriate to use Internet-Drafts as reference
   material or to cite them other than as "work in progress."

   This Internet-Draft will expire on 24 April 2022.

Copyright Notice

   Copyright (c) 2021 IETF Trust and the persons identified as the
   document authors.  All rights reserved.

   This document is subject to BCP 78 and the IETF Trust's Legal
   Provisions Relating to IETF Documents (https://trustee.ietf.org/
   license-info) in effect on the date of publication of this document.
   Please review these documents carefully, as they describe your rights
   and restrictions with respect to this document.

Table of Contents

   1.  Introduction  . . . . . . . . . . . . . . . . . . . . . . . .   2
   2.  Metazones . . . . . . . . . . . . . . . . . . . . . . . . . .   2




Instenes & Wicinski       Expires 24 April 2022                 [Page 1]

Internet-Draft                  metazones                   October 2021


     2.1.  Description . . . . . . . . . . . . . . . . . . . . . . .   2
     2.2.  Resource Records  . . . . . . . . . . . . . . . . . . . .   2
       2.2.1.  APL . . . . . . . . . . . . . . . . . . . . . . . . .   2
       2.2.2.  PTR . . . . . . . . . . . . . . . . . . . . . . . . .   2
       2.2.3.  Use of DNAME  . . . . . . . . . . . . . . . . . . . .   2
   Authors' Addresses  . . . . . . . . . . . . . . . . . . . . . . .   3

1.  Introduction

   [RFC1035] describes a "catalog" as a data structure that lists the
   zones and where the zone data can be located.  DNS zone data is
   currently synchronize between primary and secondary nameservers using
   existing DNS protocols AXFR [RFC5936] and IXFR [RFC1995].  The
   configuration of these synchronization methods currently happen
   outside of the DNS and involve adhoc processes.

   A method for managing zone catalog provisioning and synchronization
   in a similiar method as DNS zone data, can be useful to
   administrators.  While the initial concept of a catalog is a list of
   zones, and zone data pointers, nameserver deployments have grown more
   complex over time.  There is a need to manage multiple "catlogs" of
   distinct zones, as well as describing individual properties of a
   zone, such as allowing zone transfers, queries, etc.

   This document describes one such method, in which this management
   information is represented as a regular DNS zone called a "metazone",
   and transferred using DNS zone transfers.  The representation of this
   data within DNS zones is specified and nameserver requirements are
   listed.

2.  Metazones

2.1.  Description

   [Start here with describing zone data]

2.2.  Resource Records

2.2.1.  APL

2.2.2.  PTR

   Used for attributes

2.2.3.  Use of DNAME

   Example:




Instenes & Wicinski       Expires 24 April 2022                 [Page 2]

Internet-Draft                  metazones                   October 2021


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

Authors' Addresses

   Shawn Instenes (editor)

   Email: shawn@instenes.com


   Tim Wicinski (editor)
   Elkins, WV 26241
   United States of America

   Email: tjw.ietf@gmail.com

























Instenes & Wicinski       Expires 24 April 2022                 [Page 3]
```
