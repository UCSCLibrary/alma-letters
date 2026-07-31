<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="senderReceiver">
<div>
<xsl:attribute name="style">
		<xsl:call-template name="senderReceiverStyle" /> <!-- style.xsl -->
	</xsl:attribute>
<!--[if mso]>
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
	<td width="50%" valign="middle" align="left">
<![endif]-->
	<div>
	<xsl:attribute name="style">
		<xsl:call-template name="receiverStyle" /> <!-- style.xsl -->
	</xsl:attribute>
	<xsl:choose>
		<xsl:when test="notification_data/user_for_printing">
			<p><b><xsl:value-of select="notification_data/user_for_printing/name"/></b><br />
			<xsl:variable name="address1" select="notification_data/user_for_printing/address1"></xsl:variable>
			<xsl:variable name="address2" select="notification_data/user_for_printing/address2"></xsl:variable>
			<xsl:variable name="address3" select="notification_data/user_for_printing/address3"></xsl:variable>
			<xsl:variable name="address4" select="notification_data/user_for_printing/address4"></xsl:variable>
			<xsl:variable name="address5" select="notification_data/user_for_printing/address5"></xsl:variable>
			<xsl:variable name="state" select="notification_data/user_for_printing/state"></xsl:variable>
			<xsl:if test="$address1 != ''"><xsl:value-of select="$address1"/><br /></xsl:if>
			<xsl:if test="$address2 != ''"><xsl:value-of select="$address2"/><br /></xsl:if>
			<xsl:if test="$address3 != ''"><xsl:value-of select="$address3"/><br /></xsl:if>
			<xsl:if test="$address4 != ''"><xsl:value-of select="$address4"/><br /></xsl:if>
			<xsl:if test="$address5 != ''"><xsl:value-of select="$address5"/><br /></xsl:if>
			<xsl:value-of select="notification_data/user_for_printing/city"/>
			<xsl:if test="$state != ''">,&#160;<xsl:value-of select="$state"/></xsl:if>
			&#160;<xsl:value-of select="notification_data/user_for_printing/postal_code"/><br />
			<xsl:value-of select="notification_data/user_for_printing/country"/></p>
		</xsl:when>

		<xsl:when test="notification_data/receivers/receiver/user">
			<xsl:for-each select="notification_data/receivers/receiver/user">
			<xsl:variable name="rec_state" select="user_address_list/user_address/state_province"></xsl:variable>
			<p><b><xsl:value-of select="last_name"/>,&#160;<xsl:value-of select="first_name"/></b><br />
			<xsl:value-of select="user_address_list/user_address/line1"/><br />
			<xsl:value-of select="user_address_list/user_address/line2"/><br />
			<xsl:value-of select="user_address_list/user_address/city"/>
			<xsl:if test="$rec_state != ''">,&#160;<xsl:value-of select="$rec_state"/></xsl:if>
			&#160;<xsl:value-of select="user_address_list/user_address/postal_code"/><br />
			<xsl:value-of select="user_address_list/user_address/country"/></p>
			</xsl:for-each>
		</xsl:when>

		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	</div>

<!--[if mso]>
    </td>
    <td width="49%" valign="middle" align="right">
<![endif]-->
	<xsl:for-each select="notification_data/organization_unit">
		<div>
		<xsl:attribute name="style">
			<xsl:call-template name="senderStyle" /> <!-- style.xsl -->
		</xsl:attribute>
			<p><xsl:value-of select="name"/><br />
			<xsl:if test="address/line1 != ''"><xsl:value-of select="address/line1"/><br /></xsl:if>
			<xsl:if test="address/line2 != ''"><xsl:value-of select="address/line2"/><br /></xsl:if>
			<xsl:value-of select="address/city"/>
			<xsl:if test="address/state_province != ''">,&#160;<xsl:value-of select="address/state_province"/></xsl:if>
			&#160;<xsl:value-of select="address/postal_code"/><br />
			<xsl:value-of select="address/country"/></p>
		</div>
	</xsl:for-each>
<!--[if mso]>
	</td>
	</tr>
</table>
<![endif]-->
</div>
</xsl:template>
</xsl:stylesheet>
