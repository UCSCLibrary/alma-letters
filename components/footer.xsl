<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="salutation">
</xsl:template>

<xsl:template name="lastFooter">
	<div>
		<xsl:attribute name="style">
			<xsl:call-template name="footerTableStyleCss" /> <!-- style.xsl -->
		</xsl:attribute>
		<xsl:for-each select="notification_data/organization_unit">
			<span><xsl:value-of select="name"/>&#160;<xsl:value-of select="line1"/>&#160;<xsl:value-of select="line2"/>&#160;<xsl:value-of select="city"/>&#160;<xsl:value-of select="postal_code"/>&#160;<xsl:value-of select="country"/></span>
		</xsl:for-each>
	</div>

	<div>

		<div>
			<xsl:attribute name="style">
				<xsl:call-template name="footerLinkStyle" />
			</xsl:attribute>
			<a>
			  <xsl:attribute name="href">@@email_contact_us@@</xsl:attribute>
				@@contact_us@@
			</a>
		</div>

		<div>
			<xsl:attribute name="style">
				<xsl:call-template name="footerLinkStyle" />
			</xsl:attribute>
			<a>
			  <xsl:attribute name="href">@@email_my_account@@</xsl:attribute>
				@@my_account@@
			</a>
		</div>

	</div>
</xsl:template>

<!-- added these to the template above, phase them out in letters -->
<xsl:template name="contactUs">
	<table align="left">
	<tr>
	<td align="left">
		<a>
	    <xsl:attribute name="href">
	      @@email_contact_us@@
	    </xsl:attribute>
			@@contact_us@@
		</a>
	</td>
</tr>
	</table>
</xsl:template>

<xsl:template name="myAccount">
	<table align="right">
	<tr>
	<td align="right">
	<a>
                        <xsl:attribute name="href">
                          @@email_my_account@@
                        </xsl:attribute>
						@@my_account@@
					</a>
	</td>
</tr>
	</table>
</xsl:template>

</xsl:stylesheet>
