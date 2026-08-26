<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />

  <xsl:template match="/">
    <html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

      <head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

          <div class="messageBody">

			  <xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">
					<p><strong>@@reminder_message@@</strong></p>

	        <xsl:if test="notification_data/overdue_loans_by_library/library_loans_for_display">
						<p><strong>@@overdue_loans@@</strong></p>
						<xsl:for-each select="notification_data/overdue_loans_by_library/library_loans_for_display">
								<table cellpadding="5" class="listing">
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss" />
									</xsl:attribute>
									<tr>
										<th>@@title@@</th>
										<th>@@description@@</th>
										<th>@@author@@</th>
										<th>@@due_date@@</th>
										<th>@@fine@@</th>
										<th>@@library@@</th>
									</tr>

									<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
										<tr>
											<td><xsl:value-of select="title"/></td>
											<td><xsl:value-of select="description"/></td>
											<td><xsl:value-of select="author"/></td>
											<td><xsl:value-of select="due_date"/></td>
											<td><xsl:value-of select="normalized_fine"/></td>
											<td><xsl:value-of select="library_name"/></td>
										</tr>
									</xsl:for-each>
								</table>

						</xsl:for-each>
				</xsl:if>

				<xsl:if test="notification_data/loans_by_library/library_loans_for_display">
					<p><strong>@@loans@@</strong></p>
					<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
							<table cellpadding="5" class="listing">
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss" />
									</xsl:attribute>
									<tr>
										<th>@@title@@</th>
										<th>@@due_date@@</th>
										<th>@@fine@@</th>
										<th>@@description@@</th>
										<th>@@library@@</th>
									</tr>

									<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
										<tr>
											<td><xsl:value-of select="title"/></td>
											<td><xsl:value-of select="due_date"/></td>
											<td><xsl:value-of select="normalized_fine"/></td>
											<td><xsl:value-of select="description"/></td>
											<td><xsl:value-of select="library_name"/></td>
										</tr>
									</xsl:for-each>
							</table>

					</xsl:for-each>
				</xsl:if>

			</xsl:if>

			  <xsl:if test="notification_data/organization_fee_list/string">
						<p><strong>@@debt_message@@</strong></p>

	              <xsl:for-each select="notification_data/organization_fee_list/string">
	              	<p><xsl:value-of select="."/></p>
	              </xsl:for-each>

				  <p><strong>@@total@@ <xsl:value-of select="notification_data/total_fee"/></strong></p>

	        <p><strong>@@please_pay_message@@</strong></p>
			  </xsl:if>

	<p><span>@@sincerely@@</span><br />
	<span>@@department@@</span></p>
</div>

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
