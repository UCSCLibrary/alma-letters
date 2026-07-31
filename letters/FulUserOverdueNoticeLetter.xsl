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
	<html lang="en" dir="ltr">
		<head>
			<title><xsl:value-of select="notification_data/general_data/subject"/></title>
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

			<p><b>@@message@@</b></p>

          <table cellpadding="5" class="listing">
						<xsl:attribute name="style">
							<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
						</xsl:attribute>
						<tr>
							<th>@@title@@</th>
							<th>@@description@@</th>
							<th>@@author@@</th>
							<th>@@due_date@@</th>
							<th>@@library@@</th>
						</tr>

            <xsl:for-each select="notification_data/item_loans/item_loan">
						<tr>
							<td><xsl:value-of select="title"/></td>
							<td><xsl:value-of select="description"/></td>
							<td><xsl:value-of select="author"/></td>
							<td><xsl:value-of select="new_due_date_str"/></td>
							<td><xsl:value-of select="library_name"/></td>

						</tr>
						</xsl:for-each>
          </table>

<xsl:choose>
  <xsl:when test="notification_data/receivers/receiver/user/user_group = 'NETWORK'">
    <p>To renew your items, log in to your home campus library account.</p>
  </xsl:when>
  <xsl:otherwise>
    <p>To renew your items, log in to your <a href="https://guides.library.ucsc.edu/myaccount">
<value-of select="UCSC library account"/> UCSC library account</a>.</p>
  </xsl:otherwise>
</xsl:choose>

	<p><span>@@sincerely@@</span><br />
	<span>@@department@@</span></p>
</div>

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
