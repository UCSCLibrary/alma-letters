<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="head">
<div>
<xsl:attribute name="style">
	<xsl:call-template name="headerLogoStyleCss" /> <!-- style.xsl -->
</xsl:attribute>
	<img src="cid:logo.jpg" alt="UC Santa Cruz University Library"/>
</div>

<div>
	<xsl:attribute name="style">
		<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>
		<!--[if mso]>
	    <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0">
	    <tr>
	    <![endif]-->
	<xsl:for-each select="notification_data/general_data">
		<!--[if mso]>
	    <td valign="middle" align="left">
	    <![endif]-->
	    <div>
			<xsl:attribute name="style">
				<xsl:call-template name="letterNameDivStyle" />
			</xsl:attribute>
			<h1>
				<xsl:attribute name="style">
					<xsl:call-template name="letterNameStyle" />
				</xsl:attribute>
				<xsl:value-of select="letter_name"/>
			</h1>
		</div>
		<!--[if mso]>
	    </td>
	    <td width="30%" valign="middle" align="right">
	    <![endif]-->

		<div>
			<xsl:attribute name="style">
				<xsl:call-template name="currentDateStyle" />
			</xsl:attribute>
			<xsl:value-of select="current_date"/>
		</div>
		<!--[if mso]>
	    </td>
	    <![endif]-->
  	</xsl:for-each>
	<!--[if mso]>
	</tr>
	</table>
	<![endif]-->
</div>
</xsl:template>

</xsl:stylesheet>
