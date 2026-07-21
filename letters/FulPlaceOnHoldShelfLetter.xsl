<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />

<xsl:template match="/">
	<html>
		<head>
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

<div class="messageArea">
  <div class="messageBody">
  <table cellspacing="0" cellpadding="5" border="0">
		<tr>
			<td>@@following_item_requested_on@@ <xsl:value-of select="notification_data/request/create_date"/>, @@can_picked_at@@ <xsl:value-of select="notification_data/request/assigned_unit_name"/>.</td>
		</tr>
		<tr>
		    <td>
		        <div style="border:1px solid black;padding:0 8px;">
		            <p style="font-style:italic;"><span style="font-weight:bold;text-decoration:underline;">Please Note:</span> You may not be able to borrow the item if you have any active fines/fees at any UC Campus.</p>
                    <p style="font-style:italic;">You can verify the status of your account online by logging in to your institution's library account and reviewing the Fines + Fees tab for each campus listed.</p>
                </div>
		    </td>
		</tr>
<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
		<tr>
			<td>@@note_item_held_until@@ <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.</td>
		</tr>
</xsl:if>
		<tr>
			<td><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></td>
		</tr>
    <tr>
      <td>Call Number: <xsl:value-of select="notification_data/phys_item_display/available_items/available_item/call_number"/></td>
    </tr>
    <tr>
      <td>Barcode: <xsl:value-of select="notification_data/phys_item_display/available_items/available_item/barcode"/></td>
    </tr>
	<xsl:if test="notification_data/request/system_notes">
		<tr>
			<td>@@notes_affect_loan@@:</td>
		</tr>
		<tr>
			<td><xsl:value-of select="notification_data/request/system_notes"/></td>
		</tr>
  </xsl:if>
  </table>
	</div>
</div>
<br />
				<table>
						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>
				</table>

<!-- footer.xsl -->
				<xsl:call-template name="lastFooter" />
                                <xsl:call-template name="contactUs" />
                                <xsl:call-template name="myAccount" />
</xsl:if><!-- test="notification_data/request/from_another_inst=''" -->


<!--AFN REQUESTS ONLY-->


<xsl:if test="notification_data/request/from_another_inst != ''">
  <table cellspacing="0" cellpadding="5" border="0">


    <!-- THIS IS THE CHUNK FOR THE GENERIC PART OF THE MESSAGE -->
    <tr>
      <td>
        The library material you recently requested has been delivered and is ready for pickup.   This material may be picked up at:  <xsl:value-of select="/notification_data/request/delivery_address"/>.

        <br /><br />

        <b>Please pick this up promptly.  The item will be held for you until: <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/></b>
      </td>
    </tr>


  <xsl:if test="/notification_data/request/delivery_address">
    <xsl:choose>


      <!-- THIS IS THE CHUNK FOR SHIELDS PICKUP WITH SPECIAL SELF SERVICE HOLD INSTRUCTIONS -->
      <xsl:when test="/notification_data/request/delivery_address = 'Shields Library'">
          <tr>
              <td>
                  <p>The library material you recently requested is ready to be picked up at the Shields Library Hold Shelf located in the lobby. Look for your library material by your last name. Materials must be checked out at the self service kiosks or the main Circulation desk.  The material will be held for one week only. If you no longer need the library material please notify us.</p>

                  <p><b>If you would like it shipped to you instead, please reply with a complete off-campus shipping address for home delivery.</b></p>
              </td>
          </tr>
      </xsl:when>


      <!-- THIS IS THE CHUNK FOR BLAISDELL SHOULD ONLY APPLY TO REQUESTS PLACED BEFORE COVID RESPONSE THEIR HOLD SHELF IS INACTIVE -->
      <xsl:when test="/notification_data/request/delivery_address = 'Blaisdell Medical Library'">
          <tr>
              <td>
                  <p><b>If you would like it shipped to you instead, please reply with a complete off-campus shipping address for home delivery.</b></p>
              </td>
          </tr>
      </xsl:when>


      <!-- THIS IS THE CHUNK FOR CARLSON SHOULD ONLY APPLY TO REQUESTS PLACED BEFORE CARLSON CLOSED FOR COVID -->
      <xsl:when test="/notification_data/request/delivery_address = 'Carlson Health Sci Library'">
          <tr>
              <td>
                  <p><b>If you would like it shipped to you instead, please reply with a complete off-campus shipping address for home delivery.</b></p>
              </td>
          </tr>
      </xsl:when>

      <!-- THIS IS THE CHUNK FOR RIVERSIDE -->
      <xsl:when test="/notification_data/request/delivery_address = 'University of California Riverside - Rivera Library'">

          <tr>
              <td>

             <!-- RIVERSIDE PICKUP INSTRUCTIONS GO HERE -->
               
              </td>
          </tr>
          <tr>
            <td>
                <b>Requested Materials:</b>
            </td>
        </tr>
      </xsl:when>

      <!-- THIS IS THE CHUNK FOR UCI WITH SPECIAL CURBSIDE PICKUP INSTRUCTIONS -->
      <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Irvine')">
          <tr>
              <td>

                  <p>Visit https://www.lib.uci.edu/paging-pickup-services for your pickup options.</p>

              </td>
          </tr>
      </xsl:when>


      <!-- THIS IS THE CHUNK FOR UCM WITH SPECIAL CURBSIDE PICKUP INSTRUCTIONS -->
      <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Merced')">
          <tr>
              <td>

                  <p>You can schedule a time to pick-up your items here: https://library.ucmerced.edu/use/borrowing/curbside</p>

              </td>
          </tr>
      </xsl:when>


  </xsl:choose>

  </xsl:if> <!-- test="/notification_data/request/delivery_address" -->

  <tr>
      <td><br /><br /><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl -->
      </td>
  </tr>


</table>

</xsl:if>  <!-- test="notification_data/request/from_another_inst != ''" -->


<!-- AFN CONTACT INFORMATION -->


<xsl:if test="/notification_data/request/delivery_address">
<table>
  <xsl:choose>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Los Angeles')">
        <tr><td>Contact information for your pickup library:</td></tr>
        <tr><td>UCLA Library Circulation</td></tr><tr><td>yrl-circ@library.ucla.edu</td></tr>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Berkeley')">
        <tr><td>Contact information for your pickup library:</td></tr>
        <tr><td>maincirc-library@berkeley.edu</td></tr>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Santa Cruz')">
        <tr><td>Contact information for your pickup library:</td></tr>
        <tr><td>library@ucsc.edu</td></tr><tr><td>831-459-5185</td></tr>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California San Francisco')">
        <tr><td>Contact information for your pickup library:</td></tr>
        <tr><td>UCSF Library</td></tr><tr><td>borrowing@ucsflibrary.zendesk.com</td></tr>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Merced')">
        <tr><td>Contact information for your pickup library:</td></tr>
        <tr><td>UC Merced Library</td></tr><tr><td>209-228-4444 - library@ucmerced.edu</td></tr>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Riverside')">
        <tr><td><b>Contact information for your pickup library:</b></td></tr> <br />
        <tr><td>UCR Library Circulation Services</td></tr><tr><td><a href="mailto:library_circulation@ucr.edu">library_circulation@ucr.edu</a></td></tr>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Irvine')">
        <tr><td>Contact information for your pickup library:</td></tr>
        <tr><td>UCI Libraries Circulation Department</td></tr><tr><td>circadm@uci.edu</td></tr>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California San Diego')">
        <tr><td>Contact information for your pickup library:</td></tr>
        <tr><td>UC San Diego Library Circulation</td></tr><tr><td>libraryborrowing@ucsd.edu</td></tr>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Santa Barbara')">
        <tr><td>Contact information for your pickup library:</td></tr>
        <tr><td>Contact us at https://www.library.ucsb.edu/services/circulation/contact</td></tr>
    </xsl:when>

    <xsl:when test="contains(/notification_data/request/delivery_address, 'University of California Davis')">
        <tr><td>Contact information for your pickup library:</td></tr>
        <tr><td>UCD Library</td></tr><tr><td>530-752-9850 -- shieldscirc@ucdavis.edu</td></tr>
    </xsl:when>

  </xsl:choose>
</table>
</xsl:if><!-- test="/notification_data/request/delivery_address" -->


</body>
</html>
</xsl:template>
</xsl:stylesheet>




