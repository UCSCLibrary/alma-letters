<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="toWhomIsConcerned">
<p>
	<xsl:attribute name="style">
		<xsl:call-template name="toWhomStyle" /> <!-- style.xsl -->
	</xsl:attribute>
	<xsl:for-each select="notification_data">
	<span>@@dear@@&#160;<xsl:value-of select="receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="receivers/receiver/user/last_name"/>,</span>
</xsl:for-each> 
</p>
</xsl:template>

</xsl:stylesheet>
