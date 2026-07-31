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
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>
				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

					<div class="messageBody">
						<p>@@on@@
									<xsl:value-of select="notification_data/general_data/current_date" />
									@@we_cancel_y_req_of@@
									<xsl:value-of select="notification_data/request/create_date" />
									@@detailed_below@@:
								</p>
							<p><xsl:call-template name="recordTitle" /></p> <!-- recordTitle.xsl -->

							<p>
							<!-- <xsl:if test="notification_data/metadata/title != ''">
										<b>@@title@@: </b>
										<xsl:value-of select="notification_data/metadata/title" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/journal_title != ''">
										<b> @@journal_title@@: </b>
										<xsl:value-of select="notification_data/metadata/journal_title" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/author != ''">
										<b> @@author@@: </b>
										<xsl:value-of select="notification_data/metadata/author" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/author_initials != ''">
										<b>@@author_initials@@: </b>
										<xsl:value-of select="notification_data/metadata/author_initials" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/edition != ''">
										<b> @@edition@@: </b>
										<xsl:value-of select="notification_data/metadata/edition" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/identifier != ''">
										<b>@@identifier@@: </b>
										<xsl:value-of select="notification_data/metadata/identifier" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/lccn != ''">
										<b> @@lccn@@: </b>
										<xsl:value-of select="notification_data/metadata/lccn" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/issn != ''">
										<b>@@issn@@: </b>
										<xsl:value-of select="notification_data/metadata/issn" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/isbn != ''">
										<b> @@isbn@@: </b>
										<xsl:value-of select="notification_data/metadata/isbn" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/oclc_nr != ''">
										<b> @@oclc_nr@@: </b>
										<xsl:value-of select="notification_data/metadata/oclc_nr" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/doi != ''">
										<b>@@doi@@: </b>
										<xsl:value-of select="notification_data/metadata/doi" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/pmid != ''">
										<b> @@pmid@@: </b>
										<xsl:value-of select="notification_data/metadata/pmid" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/publisher != ''">
										<b> @@publisher@@: </b>
										<xsl:value-of select="notification_data/metadata/publisher" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/publication_date != ''">
										<b>@@publication_date@@: </b>
										<xsl:value-of select="notification_data/metadata/publication_date" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/place_of_publication != ''">
										<b> @@place_of_publication@@: </b>
										<xsl:value-of select="notification_data/metadata/place_of_publication" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/additional_person_name != ''">
										<b> @@additional_person_name@@: </b>
										<xsl:value-of select="notification_data/metadata/additional_person_name" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/source != ''">
										<b>@@source@@: </b>
										<xsl:value-of select="notification_data/metadata/source" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/series_title_number != ''">
										<b> @@series_title_number@@: </b>
										<xsl:value-of select="notification_data/metadata/series_title_number" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/call_number != ''">
										<b> @@call_number@@: </b>
										<xsl:value-of select="notification_data/metadata/call_number" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/volume != ''">
										<b>@@volume@@: </b>
										<xsl:value-of select="notification_data/metadata/volume" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/part != ''">
										<b> @@part@@: </b>
										<xsl:value-of select="notification_data/metadata/part" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/chapter != ''">
										<b> @@chapter@@: </b>
										<xsl:value-of select="notification_data/metadata/chapter" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/pages != ''">
										<b>@@pages@@: </b>
										<xsl:value-of select="notification_data/metadata/pages" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/start_page != ''">
										<b> @@start_page@@: </b>
										<xsl:value-of select="notification_data/metadata/start_page" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/end_pagee != ''">
										<b> @@end_page@@: </b>
										<xsl:value-of select="notification_data/metadata/end_page" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/issue != ''">
										<b>@@issue@@: </b>
										<xsl:value-of select="notification_data/metadata/issue" /><br />
							</xsl:if>
							<xsl:if test="notification_data/metadata/note != ''">
										<b> @@note@@: </b>
										<xsl:value-of select="notification_data/metadata/note" /><br />
							</xsl:if> -->


							<xsl:if test="notification_data/request/start_time != ''">
										<b> @@start_time@@: </b>
										<xsl:value-of select="notification_data/booking_start_time_str" /><br />
							</xsl:if>
						<xsl:if test="notification_data/request/end_time != ''">
										<b> @@end_time@@: </b>
										<xsl:value-of select="notification_data/booking_end_time_str" /><br />
							</xsl:if>
						<!-- <xsl:if test="notification_data/request/note != ''">
										<b> @@request_note@@: </b>
										<xsl:value-of select="notification_data/request/note" /><br />
							</xsl:if> -->
							<xsl:if test="notification_data/request/status_note_display != ''">
									<b> @@reason_deleting_request@@: </b>
									<xsl:value-of select="notification_data/request/status_note_display" /><br />
							</xsl:if>
							<xsl:if test="notification_data/request/cancel_reason != ''">
										<b> @@request_cancellation_note@@: </b>
										<xsl:value-of select="notification_data/request/cancel_reason" /><br />
							</xsl:if>
						</p>

	<p><span>@@sincerely@@</span><br />
	<span>@@department@@</span></p>
</div>

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
