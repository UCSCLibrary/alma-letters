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
				<p>@@following_loaned_item_which_has@@</p>

				<xsl:for-each select="notification_data">
				<p>
					<b>@@title@@: </b><xsl:value-of select="item_loan/title"/><br />
					<b>@@loan_details@@: </b><xsl:value-of select="item_loan/description"/><br />
					<b>@@author@@: </b><xsl:value-of select="item_loan/author"/><br />
					<b>@@library@@: </b><xsl:value-of select="organization_unit/name"/><br />
					<b>@@loan_date@@: </b><xsl:value-of select="item_loan/loan_date"/><br />
					<b>@@due_date@@: </b><xsl:value-of select="item_loan/due_date"/>
				</p>

				<p><b>@@your_account_balance_will_be_credited@@:</b></p>
				<p>@@bellow_details_charges_credits_due@@</p>
				</xsl:for-each>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<th>@@fee_type@@</th>
						<th align="right" width="10">@@fee_amount@@</th>
						<th>@@note@@</th>
					</tr>
					<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
					<tr>
						<td><xsl:value-of select="fine_fee_type_display"/></td>
						<td align="right"><xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/></td>
						<td><xsl:value-of select="finecomment"/></td>
					</tr>
					</xsl:for-each>

					<tr>
						<td align="right"><b>@@total@@:</b></td>
						<td align="right"><xsl:value-of select="notification_data/total_fines_amount"/>&#160;<xsl:value-of select="notification_data/fines_fees_list/user_fines_fees/fine_fee_ammount/currency"/></td>
					</tr>
				</table>

	<p><span>@@sincerely@@</span><br />
	<span>@@department@@</span></p>
</div>

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>