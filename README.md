# BJCP-styles-XML
The new 2015 BJCP style guidelines in XML, using as close as the same schema as possible to previous releases (2004, 2008)

## Introduction
The Beer Judge Certification Program (BJCP) puts out the style guidelines for beer as well as cider and mead.
They've recently released a significant revision to their style guides, but so far only in PDF and Word format.

## Differences in the XML
The new style guides added some extra standard paragraphs to the style descriptions as well as a Tags: section.
The two new paragraphs are given the element tags <comparison> for "Style Comparison" and <entryinstructions> for 
"Entry Instructions" paragrahps.  The style's tags are in a comma-separated list in a <tags> element.

The 2015 guidelines also renumbered all the styles from the 2008 version and added unnumbered sub-styles to a few styles 
(eg. 21B American IPA). Since the style and sub-style formats are identical I've used the <subcategory> tags for both.
For sub-styles the id attribute is the parent style's number followed by a "-some-label" to maek id unique for every entry.
(Example: Black IPA (aka Cascadian Dark Ale) gets id="21B-black")
