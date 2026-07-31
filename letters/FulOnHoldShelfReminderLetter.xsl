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

            <p>@@message@@</p>
            <p>@@following_items_awaiting_pickup@@</p>

                  <xsl:for-each select="notification_data/requests_by_library/library_requests_for_display">
                                <table cellpadding="5" class="listing">
                                    <xsl:attribute name="style">
                                        <xsl:call-template name="mainTableStyleCss" />
                                    </xsl:attribute>
                                    <tr align="center" bgcolor="#f5f5f5">
                                        <td colspan="4">
                                            <h3><xsl:value-of select="organization_unit/name" /></h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>@@title@@</th>
                                        <th>@@author@@</th>
                                        <th>@@can_picked_at@@</th>
                                        <th>@@note_item_held_until@@</th>
                                    </tr>

                                    <xsl:for-each select="requests/request_for_display">
                                        <tr>
                                            <td><xsl:value-of select="phys_item_display/title"/></td>
                                            <td><xsl:value-of select="phys_item_display/author"/></td>
                                            <td><xsl:value-of select="request/assigned_unit_name"/></td>
                                            <td><xsl:value-of select="request/work_flow_entity/expiration_date"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                    </xsl:for-each>
                    
                    <xsl:if test="notification_data/out_of_institution_requests/request_for_display">
                                <table cellpadding="5" class="listing">
                                    <xsl:attribute name="style">
                                        <xsl:call-template name="mainTableStyleCss" />
                                    </xsl:attribute>
                                    <tr align="center" bgcolor="#f5f5f5">
                                        <td colspan="4">
                                            <h3>@@other_institutions@@</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>@@title@@</th>
                                        <th>@@author@@</th>
                                        <th>@@can_picked_at@@</th>
                                        <th>@@note_item_held_until@@</th>
                                    </tr>

                                    <xsl:for-each select="notification_data/out_of_institution_requests/request_for_display">
                                        <tr>
                                            <td><xsl:value-of select="phys_item_display/title"/></td>
                                            <td><xsl:value-of select="phys_item_display/author"/></td>
                                            <td><xsl:value-of select="request/assigned_unit_name"/></td>
                                            <td><xsl:value-of select="request/work_flow_entity/expiration_date"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                    </xsl:if>
                    
                    <xsl:if test="notification_data/user_for_printing/blocks != ''">
                        <p><b>@@notes_affect_loan@@:</b></p>
                        <p><xsl:value-of select="notification_data/user_for_printing/blocks"/></p>
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