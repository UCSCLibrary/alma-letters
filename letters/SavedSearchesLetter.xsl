<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html lang="en" dir="ltr">
		<head>
			<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
			<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
			<title><xsl:value-of select="notification_data/general_data/subject"/></title>
			<xsl:call-template name="generalStyle" />
		</head>
		<body>
			<div>
				<xsl:attribute name="style">
					<xsl:call-template name="headerLogoStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
				<img alt="UC Santa Cruz University Library">
					<xsl:attribute name="src">
						<xsl:value-of select="/notification_data/logo_path"/>
					</xsl:attribute>
				</img>
			</div>
			<div>
				<xsl:attribute name="style">
					<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
				<div style="font-size:16px;">
					<h1>
						<xsl:attribute name="style">
							<xsl:call-template name="letterNameStyle" />
						</xsl:attribute>
						<xsl:value-of select="/notification_data/alert_title"/>
					</h1>
				</div>
			</div>

			<div class="messageBody">
				<p><b><xsl:value-of select="/notification_data/alert_heading"/></b>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="/notification_data/link/node()"/>
								</xsl:attribute>
								<xsl:value-of select="/notification_data/search_query"/>
							</a>
				</p>

				<p><em><xsl:value-of select="/notification_data/alert_subtitle"/></em></p>

						<div style="width: 100%;max-width:850px;">
							<xsl:for-each select="/notification_data/items/saved_searches_letter_item">
								<div style="padding:15px 0;text-decoration: none;border-bottom:1px solid #ccc;">
										<span style="text-transform: uppercase; letter-spacing: .07em; font-weight: 600; font-size: .8em; color: #6d6d6d">
											<xsl:value-of select="type" disable-output-escaping="yes"/>
										</span>
										<br/>
										<a style="display: block; margin: 5px 0; text-decoration: none; color: #44707b; font-size: 1.4em; font-weight: 600;">
											<xsl:attribute name="href">
												<xsl:value-of select="url" disable-output-escaping="yes"/>
											</xsl:attribute>
											<xsl:value-of select="title" disable-output-escaping="yes"/>
										</a>
										<br/>
										<span style="color: #3a3a3a; font-weight: 400; font-size: .8rem;">
											<xsl:value-of select="creator" disable-output-escaping="yes"/>
										</span>
								</div>
							</xsl:for-each>
						</div>

					<div style="background-color: #4d6b82; text-align:center; padding: 15px">
							<a style="color: #fff">
								<xsl:attribute name="href">
									<xsl:value-of select="/notification_data/alert_unsubscribe_link/node()"/>
								</xsl:attribute>
								<xsl:value-of select="/notification_data/alert_unsubscribe"/>
							</a>
					</div>
		</div>
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>
