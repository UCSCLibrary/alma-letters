<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html lang="en" dir="ltr">
		<head>
			<title><xsl:value-of select="notification_data/general_data/subject"/></title>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
				<div class="messageBody">
					<p>@@You_were_specify@@:</p>

				<!-- <p>@@orderNumber@@:&#160;<xsl:value-of select="notification_data/line_number"/></p> -->
				
				<p>@@title@@
					<a>
					<xsl:attribute name="href">
					    <xsl:value-of select='concat("https://ucsc.primo.exlibrisgroup.com/discovery/fulldisplay?docid=alma", notification_data/mms_id, "&amp;vid=01CDL_SCR_INST:USCS&amp;lang=en" )' />
		            </xsl:attribute>
			        <xsl:value-of  select="notification_data/title"/>
					</a>
				</p>

				<!--<p>@@mmsId@@ 
					<xsl:value-of  select="notification_data/mms_id"/>
					</p>-->

				<xsl:if test="notification_data/message != 'E-resource was activated.'"> 
				<p>@@callNumber@@&#160;<xsl:value-of  select="notification_data/poline_inventory/call_number"/></p>
				</xsl:if>

				<!--<p>@@receivingNote@@ 
				<xsl:value-of  select="notification_data/receiving_note"/>
				</p>-->

				<p>@@message@@&#160;
				<xsl:choose>
				  <xsl:when test="notification_data/message='E-resource was activated.'">
				    This E-Resource is now available in UC Library Search.
				  </xsl:when>
				  <xsl:otherwise>
				    <xsl:value-of  select="notification_data/message"/>
				  </xsl:otherwise>
				</xsl:choose>
				</p>

	<p><span>@@sincerely@@</span><br />
	<span>@@department@@</span></p>
</div>

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>
