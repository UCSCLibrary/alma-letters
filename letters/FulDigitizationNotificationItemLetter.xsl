<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />
  <xsl:variable name="isDeposit" select="/notification_data/request/deposit_indicator" />
  <xsl:variable name="isDigitalDocDelivery" select="/notification_data/digital_document_delivery" />

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
          <xsl:call-template name="bodyStyleCss" />
          <!-- style.xsl -->
        </xsl:attribute>
        <xsl:call-template name="head" />
        <!-- header.xsl -->

          <div class="messageBody">
            <p>@@your_request@@.</p>

				<xsl:if test="$isDeposit='true'">
				<p>@@material@@: <a>
                        <xsl:attribute name="href">
                          <xsl:value-of select="notification_data/item_url" />
                        </xsl:attribute>
						<xsl:value-of select="notification_data/phys_item_display/title"/>
					</a>
				</p>
				</xsl:if>

				<xsl:if test="$isDigitalDocDelivery='true' or $isDeposit='false'"> <!-- DOCUMENT DELIVERY -->
					<p>@@material@@:&#160;<xsl:value-of select="notification_data/phys_item_display/title"/></p>

					<!--<xsl:if test="$externalRequestId">
						<p>@@the_request_relates@@<xsl:value-of select="$externalRequestId"/> @@of@@ <xsl:value-of select="$externalSystem"/>.</p>
					</xsl:if> -->

					<xsl:if test="/notification_data/url_list[string]">
						<p>@@attached_are_the_urls@@:</p>
						<ul>
						<xsl:for-each select="/notification_data/attachments_list/attachments">
							<xsl:if test="url">
								<li>
									<a>
									<xsl:attribute name="href">
										<xsl:value-of select="url" />
									</xsl:attribute>
									<xsl:value-of select="url" />
									</a></li>
							</xsl:if>
						</xsl:for-each>
						</ul>

					</xsl:if>
        </xsl:if>

					<p>@@request_type_digitization@@</p>

				<xsl:if test="/notification_data/request/citation_upload_file_status">
					<xsl:choose>
											<xsl:when test="/notification_data/request/citation_upload_file_status = 'FILE_NOT_UPLOADED_FILE_EXISTS'">
	                        <p>@@file_not_uploaded_file_exists@@.</p>
	                    </xsl:when>
	                    <xsl:when test="/notification_data/request/citation_upload_file_status = 'FILE_NOT_UPLOADED_MULTIPLE_FILES'">
	                        <p>@@file_not_uploaded_multiple_files@@.</p>
	                    </xsl:when>
	                    <xsl:when test="/notification_data/request/citation_upload_file_status = 'FILE_NOT_UPLOADED_GENERAL_ERROR'">
	                        <p>@@file_not_uploaded_general_error@@.</p>
	                    </xsl:when>	 
	                    <xsl:when test="/notification_data/request/citation_upload_file_status = 'FILE_UPLOADED_SUCCESS'">
	                        <p>@@file_uploaded@@.</p>
	                    </xsl:when>	                     
	         </xsl:choose>
         </xsl:if>	

					<p>@@sincerely@@<br/>@@department@@</p>
          </div>
        <xsl:call-template name="lastFooter" />
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
