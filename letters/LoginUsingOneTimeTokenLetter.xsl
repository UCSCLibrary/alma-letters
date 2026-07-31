<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />
<xsl:template match="/">
	<html lang="en" dir="ltr">
		<head>
			<title><xsl:value-of select="notification_data/general_data/subject"/></title>
			<xsl:call-template name="generalStyle" />
		</head>
		<body>
			<xsl:call-template name="head" /> <!-- header.xsl -->
			<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

				<div class="messageBody">
					<p>@@bodyTextBeforeLink@@ 
						<a>
                        <xsl:attribute name="href">
                          <xsl:value-of select="notification_data/login_url" />
                        </xsl:attribute>
						@@linkLabel@@</a>
						@@bodyTextAfterLink@@<br/>
	                    @@expirationBodyText@@
		            </p>
					<p>@@signature@@<br />
					<xsl:value-of select="notification_data/institution/name" /></p>
		          </div>
			 <!-- footer.xsl -->
<xsl:call-template name="lastFooter" />
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>