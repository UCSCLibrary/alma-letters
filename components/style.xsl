<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="generalStyle">
 <style>
 body {@@language_related_body_css@@ background-color:#fff}
 .listing td {border-bottom: 1px solid #eee}
 .listing tr:hover td {background-color:#eee}
 .listing th {background-color:#f5f5f5 }
 h4{line-height: 0.2em}
 .messageBody{padding:0 20px;}
 </style>
</xsl:template>

<xsl:template name="bodyStyleCss">
font-family: 'Roboto', arial, sans-serif; color:#333; margin:0; padding:0em;
</xsl:template>

<xsl:template name="listStyleCss">
list-style: none; margin:0 0 0 1em; padding:0
</xsl:template>

<xsl:template name="mainTableStyleCss">
width:100%; text-align:left; margin-bottom:30px;
</xsl:template>

<xsl:template name="headerLogoStyleCss">
background-color:#003c6c; width:100%; padding:20px;
</xsl:template>

<xsl:template name="headerTableStyleCss">
width:100%; padding:5px 20px; background-color:#fff; border-bottom:1px solid #ccc; box-shadow:0 1px 5px #ccc; font-size:0; box-sizing:border-box;
</xsl:template>

<xsl:template name="footerTableStyleCss">
background-color:#003c6c; width:100%; color:#fff; margin-top:1em;  font-weight:700; line-height:2em; font-size:150%; text-align:center;
</xsl:template>

<xsl:template name="letterNameDivStyle">
display: inline-block; width: 75%; max-width: 75%; vertical-align: middle; font-size: 16px;
</xsl:template>

<xsl:template name="letterNameStyle">
margin:10px 0;
</xsl:template>

<xsl:template name="currentDateStyle">
display: inline-block; width: 24%; max-width: 24%; vertical-align: middle; text-align: right; font-size: 16px;
</xsl:template>

<xsl:template name="toWhomStyle">
padding:10px 20px; font-size:1.17em; font-weight:bold;
</xsl:template>

<xsl:template name="footerLinkStyle">
float:left; width:50%; margin:20px 0; text-align:center;
</xsl:template>

</xsl:stylesheet>
