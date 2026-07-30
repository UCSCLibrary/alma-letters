<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
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
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<br />
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

          <div class="messageBody">

					<xsl:if test="notification_data/message='RECALL_DUEDATE_CHANGE'">
						<p><b>@@recall_and_date_change@@</b></p>
					</xsl:if>
					<xsl:if test="notification_data/message='RECALL_ONLY'">
						<p><b>@@recall_and_no_date_change@@</b></p>
					</xsl:if>
					<xsl:if test="notification_data/message='DUE_DATE_CHANGE_ONLY'">
						<p><b>@@message@@</b></p>
					</xsl:if>
					<xsl:if test="notification_data/message='RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE'">
						<p><b>@@cancel_recall_date_change@@</b></p>
					</xsl:if>
					<xsl:if test="notification_data/message='RECALL_CANCEL_ITEM_RENEWED'">
						<p><b>@@cancel_recall_renew@@</b></p>
					</xsl:if>
					<xsl:if test="notification_data/message='RECALL_CANCEL_NO_CHANGE'">
						<p><b>@@cancel_recall_no_date_change@@</b></p>
					</xsl:if>

					<table cellpadding="5" class="listing">
						<xsl:attribute name="style">
							<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
						</xsl:attribute>
						<tr>
							<th>@@title@@</th>
							<!--<th>@@description@@</th>-->
							<th>@@author@@</th><!-- Barcode-->
							<th>@@old_due_date@@</th>
							<th>@@new_due_date@@</th>
							<th>@@library@@</th>
						</tr>

                		<xsl:for-each select="notification_data/item_loans/item_loan">
						<tr>
<td><xsl:value-of select="title"/></td>
<td><xsl:value-of select="barcode"/></td>
							<td><xsl:value-of select="old_due_date_str"/></td>
							<td><xsl:value-of select="new_due_date_str"/></td>
							<td><xsl:value-of select="library_name"/></td>
<td><xsl:value-of select="item_description"/></td>
						</tr>
						</xsl:for-each>

					</table>

	<p><span>@@sincerely@@</span><br />
	<span>@@department@@</span></p>
</div>

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>