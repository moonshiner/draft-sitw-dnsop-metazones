```




DNSOP                                                   S. Instenes, Ed.
Internet-Draft                                                          
Intended status: Informational                          T. Wicinski, Ed.
Expires: 8 March 2022                                   4 September 2021


                             DNS Metazones
                     draft-sitw-dnsop-metazones-01

Abstract

   This document describes a method for automatic zone catalog
   provisioning and synchronization among DNS primary and secondary
   nameservers by storing and transferring the catalogs as regular DNS
   zones.

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

   This Internet-Draft will expire on 8 March 2022.

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
   Authors' Addresses  . . . . . . . . . . . . . . . . . . . . . . .   2



Instenes & Wicinski       Expires 8 March 2022                  [Page 1]

Internet-Draft                  metazones                 September 2021


1.  Introduction

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

Authors' Addresses

   Shawn Instenes (editor)

   Email: shawn@instenes.com


   Tim Wicinski (editor)
   Elkins, WV 26241
   United States of America

   Email: tjw.ietf@gmail.com














Instenes & Wicinski       Expires 8 March 2022                  [Page 2]
```
