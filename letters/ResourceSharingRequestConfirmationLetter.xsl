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
					<xsl:call-template name="bodyStyleCss" />
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" /><!-- header.xsl -->
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

					<div class="messageBody">
						<p><strong>@@start@@</strong></p>

							<!--
							<xsl:if test="notification_data/request_id !=''">
								<p>
										<strong> @@internalIdentifier@@: </strong>
										<xsl:value-of select="notification_data/request_id"/>
								</p>
							</xsl:if> -->
							<!--
							<xsl:if test="notification_data/request/external_request_id !=''">
								<p>
										<strong> @@externalIdentifier@@: </strong>
										<xsl:value-of select="notification_data/request/external_request_id"/>
								</p>
							</xsl:if> -->
							<xsl:if test="notification_data/display/journal_title !=''">
								<p>
										<strong> @@journalTitle@@: </strong>
										<xsl:value-of select="notification_data/display/journal_title"/>
								</p>
								<p>
										<strong> @@articleTitle@@: </strong>
										<xsl:value-of select="notification_data/request/title"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/request/title !='' and notification_data/display/journal_title = ''">
								<p>
										<strong> @@title@@: </strong>
										<xsl:value-of select="notification_data/request/title"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/chapter_title !='' and notification_data/display/composer = null and notification_data/display/opus = null and notification_data/display/song_movement = null and notification_data/display/music_part = null">
								<p>
										<strong> @@chapterTitle@@: </strong>
										<xsl:value-of select="notification_data/display/chapter_title"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/author !=''">
								<p>
										<strong> @@by@@: </strong>
										<xsl:value-of select="notification_data/display/author"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/chapter_author !=''">
								<p>
										<strong> @@chapterAuthor@@: </strong>
										<xsl:value-of select="notification_data/display/chapter_author"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/format !=''">
								<p>
										<strong> @@format@@: </strong>
										<xsl:value-of select="notification_data/format"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/arrival_date !='' and notification_data/unavailable_resource = ''">
								<p>
										<strong> @@arrivalDate@@: </strong>
										<xsl:value-of select="notification_data/arrival_date"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/unavailable_resource != ''">
								<p>
										<strong> @@arrivalDate@@: </strong>
										@@unavailableResource@@
								</p>
							</xsl:if>
							<xsl:if test="notification_data/due_date !='' and notification_data/unavailable_resource = ''">
								<p>
										<strong> @@dueDate@@: </strong>
										<xsl:value-of select="notification_data/due_date"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/patron_cost !=''">
								<p>
										<strong> @@cost@@: </strong>
										<xsl:value-of select="notification_data/patron_cost"/>
										&#160;
										<xsl:value-of select="notification_data/currency" />
								</p>
							</xsl:if>				
							<xsl:if test="notification_data/display/chapter !=''">
								<p>
										<strong> @@chapterNumber@@: </strong>
										<xsl:value-of select="notification_data/display/chapter"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/volume !=''">
								<p>
										<strong> @@volume@@: </strong>
										<xsl:value-of select="notification_data/volume"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/issue !=''">
								<p>
										<strong> @@issue@@: </strong>
										<xsl:value-of select="notification_data/display/issue"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/start_page !=''">
								<p>
										<strong> @@startPage@@: </strong>
										<xsl:value-of select="notification_data/display/start_page"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/end_page !=''">
								<p>
										<strong> @@endPage@@: </strong>
										<xsl:value-of select="notification_data/display/end_page"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/start_page ='' and notification_data/display/end_page ='' and notification_data/display/pages !=''">
								<p>
										<strong> @@pages@@: </strong>
										<xsl:value-of select="notification_data/display/pages"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/composer !=''">
								<p>
										<strong> @@composer@@: </strong>
										<xsl:value-of select="notification_data/display/composer"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/opus !=''">
								<p>
										<strong> @@opus@@: </strong>
										<xsl:value-of select="notification_data/display/opus"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/song_movement !=''">
								<p>
										<strong> @@songMovement@@: </strong>
										<xsl:value-of select="notification_data/display/song_movement"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/music_part !=''">
								<p>
										<strong> @@part@@: </strong>
										<xsl:value-of select="notification_data/display/music_part"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/display/publication_date !=''">
								<p>
										<strong> @@publicationDate@@: </strong>
										<xsl:value-of select="notification_data/display/publication_date"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/needed_by_str !=''">
								<p>
										<strong> @@notNeededAfter@@: </strong>
										<xsl:value-of select="notification_data/needed_by_str"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/request/note !=''">
								<p>
										<strong> @@note@@: </strong>
										<xsl:value-of select="notification_data/request/note"/>
								</p>
							</xsl:if>

								<p>@@end@@</p>

								<p><span>@@signature@@</span><br />
							    <span>@@UCSC Interlibrary Loan@@</span></p>

					</div>

				<xsl:call-template name="lastFooter" />
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
