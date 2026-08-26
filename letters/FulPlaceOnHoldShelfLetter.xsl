<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
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
			<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->


<!--LOCAL REQUESTS ONLY-->
<xsl:if test="notification_data/request/from_another_inst=''">

<div class="messageBody">
  <p>@@following_item_requested_on@@ <xsl:value-of select="notification_data/request/create_date"/>, @@can_picked_at@@ <xsl:value-of select="notification_data/request/assigned_unit_name"/>.</p>

		        <div style="border:1px solid black;padding:0 8px;">
		            <p style="font-style:italic;"><span style="font-weight:bold;text-decoration:underline;">Please Note:</span> You may not be able to borrow the item if you have any active fines/fees at any UC Campus.</p>
                    <p style="font-style:italic;">You can verify the status of your account online by logging in to your institution's library account and reviewing the Fines + Fees tab for each campus listed.</p>
                </div>

<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
		<p>@@note_item_held_until@@ <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.</p>
</xsl:if>
		<p><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></p>
    <p>Call Number: <xsl:value-of select="notification_data/phys_item_display/available_items/available_item/call_number"/></p>
    <p>Barcode: <xsl:value-of select="notification_data/phys_item_display/available_items/available_item/barcode"/></p>
	<xsl:if test="notification_data/request/system_notes">
		<p>@@notes_affect_loan@@:<br />
		<xsl:value-of select="notification_data/request/system_notes"/></p>
  </xsl:if>

  <p><span>@@sincerely@@</span><br />
  <span>@@department@@</span></p>
</div>

<xsl:call-template name="lastFooter" /><!-- footer.xsl -->
</xsl:if><!-- test="notification_data/request/from_another_inst=''" -->


<!--AFN REQUESTS ONLY-->
<xsl:if test="notification_data/request/from_another_inst != ''">

<div class="messageBody">
    <!-- THIS IS THE CHUNK FOR THE GENERIC PART OF THE MESSAGE -->
    <p>The library material you recently requested has been delivered and is ready for pickup.   This material may be picked up at:  <xsl:value-of select="/notification_data/request/delivery_address"/>.</p>

    <p><b>Please pick this up promptly.  The item will be held for you until: <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/></b></p>

  <xsl:if test="/notification_data/request/delivery_address">
    <xsl:choose>

      <!-- THIS IS THE CHUNK FOR SHIELDS PICKUP WITH SPECIAL SELF SERVICE HOLD INSTRUCTIONS -->
      <xsl:when test="/notification_data/request/delivery_address = 'Shields Library'">
                  <p>The library material you recently requested is ready to be picked up at the Shields Library Hold Shelf located in the lobby. Look for your library material by your last name. Materials must be checked out at the self service kiosks or the main Circulation desk.  The material will be held for one week only. If you no longer need the library material please notify us.</p>
                  <p><b>If you would like it shipped to you instead, please reply with a complete off-campus shipping address for home delivery.</b></p>
      </xsl:when>

      <!-- THIS IS THE CHUNK FOR BLAISDELL SHOULD ONLY APPLY TO REQUESTS PLACED BEFORE COVID RESPONSE THEIR HOLD SHELF IS INACTIVE -->
      <xsl:when test="/notification_data/request/delivery_address = 'Blaisdell Medical Library'">
                  <p><b>If you would like it shipped to you instead, please reply with a complete off-campus shipping address for home delivery.</b></p>
      </xsl:when>

      <!-- THIS IS THE CHUNK FOR CARLSON SHOULD ONLY APPLY TO REQUESTS PLACED BEFORE CARLSON CLOSED FOR COVID -->
      <xsl:when test="/notification_data/request/delivery_address = 'Carlson Health Sci Library'">
                  <p><b>If you would like it shipped to you instead, please reply with a complete off-campus shipping address for home delivery.</b></p>
      </xsl:when>

      <!-- THIS IS THE CHUNK FOR RIVERSIDE -->
      <xsl:when test="/notification_data/request/delivery_address = 'University of California Riverside - Rivera Library'">
             <!-- RIVERSIDE PICKUP INSTRUCTIONS GO HERE -->
            <p><b>Requested Materials:</b></p>
      </xsl:when>

      <!-- THIS IS THE CHUNK FOR UCI WITH SPECIAL CURBSIDE PICKUP INSTRUCTIONS -->
      <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Irvine')">
                  <p>Visit https://www.lib.uci.edu/paging-pickup-services for your pickup options.</p>
      </xsl:when>

      <!-- THIS IS THE CHUNK FOR UCM WITH SPECIAL CURBSIDE PICKUP INSTRUCTIONS -->
      <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Merced')">
                  <p>You can schedule a time to pick-up your items here: https://library.ucmerced.edu/use/borrowing/curbside</p>
      </xsl:when>

    </xsl:choose>
  </xsl:if> <!-- test="/notification_data/request/delivery_address" -->

  <p><xsl:call-template name="recordTitle" /></p> <!-- recordTitle.xsl -->
</div>
</xsl:if>  <!-- test="notification_data/request/from_another_inst != ''" -->


<!-- AFN CONTACT INFORMATION -->
<xsl:if test="/notification_data/request/delivery_address">

<div class="messageBody">
  <xsl:choose>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Los Angeles')">
        <p>Contact information for your pickup library:<br />
          UCLA Library Circulation<br />
          yrl-circ@library.ucla.edu</p>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Berkeley')">
        <p>Contact information for your pickup library:<br />
          maincirc-library@berkeley.edu</p>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Santa Cruz')">
        <p>Contact information for your pickup library:<br />
          library@ucsc.edu<br />
          831-459-5185</p>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California San Francisco')">
        <p>Contact information for your pickup library:<br />
          UCSF Library<br />
          borrowing@ucsflibrary.zendesk.com</p>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Merced')">
        <p>Contact information for your pickup library:<br />
          UC Merced Library<br />
          209-228-4444 - library@ucmerced.edu</p>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Riverside')">
        <p>Contact information for your pickup library:<br />
          UCR Library Circulation Services<br />
          <a href="mailto:library_circulation@ucr.edu">library_circulation@ucr.edu</a></p>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Irvine')">
        <p>Contact information for your pickup library:<br />
          UCI Libraries Circulation Department<br />
          circadm@uci.edu</p>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California San Diego')">
        <p>Contact information for your pickup library:<br />
          UC San Diego Library Circulation<br />
          libraryborrowing@ucsd.edu</p>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Santa Barbara')">
        <p>Contact information for your pickup library:<br />
          Contact us at https://www.library.ucsb.edu/services/circulation/contact</p>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Davis')">
        <p>Contact information for your pickup library:<br />
          UCD Library<br />
          530-752-9850 -- shieldscirc@ucdavis.edu</p>
    </xsl:when>

  </xsl:choose>
</div>
</xsl:if><!-- test="/notification_data/request/delivery_address" -->

</body>
</html>
</xsl:template>
</xsl:stylesheet>
