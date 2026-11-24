<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:deccr="urn:customs.ru:Information:TransportDocuments:Sea:DeclarationCrew:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="gtd"/>
      <xsl:choose>
         <xsl:when test="substring($gtd,5,1)='-' and substring($gtd,8,1)='-'">
            <xsl:value-of select="substring($gtd,9,2)"/>
            <xsl:value-of select="substring($gtd,6,2)"/>
            <xsl:value-of select="substring($gtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$gtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="deccr:DeclarationCrew">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Декларация о личных вещах экипажа.</title>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid black 1pt #000000;
							border-collapse: collapse;
							}	
						table
							{
							vertical-align: top;
							border-collapse: collapse;
							background: #ffffff;
							}
							
							
						td {
							font-family:Arial;
							vertical-align: top;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						
						.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph14Bold {
						font-family: Arial;
						font-size: 14pt;
						font-weight: bold;
						border: 0;
						}				
						td.bordered {
					border: solid 1px windowtext;
										}	
						.uplined {
					border-top: solid 1pt #000000;
										}	
						.borderAll {
					border-bottom: solid 1pt #000000;
					border-left: solid 1pt #000000;
					border-right: solid 1pt #000000;
					border-top: solid 1pt #000000;
										}									
                </style>
         </head>
         <body>
            <div class="page">
               <table cellpadding="3" cellspacing="0" style="width:180mm">
                  <tbody>
                     <tr>
                        <td class="graph14Bold">Декларация о личных вещах экипажа
									<br/>
                           <br/>
                        </td>
                     </tr>
                     <xsl:if test="deccr:ArrivalPort">
                        <tr>
                           <td align="left">
								<xsl:text>Порт прихода: </xsl:text><xsl:value-of select="deccr:ArrivalPort"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="deccr:DeparturePort">
                        <tr>
                           <td align="left">
								<xsl:text>Порт отхода: </xsl:text><xsl:value-of select="deccr:DeparturePort"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="left">
                           <table align="left" cellpadding="3" cellspacing="0" style="width:180mm">
                              <tbody>
                                 <tr>
                                    <td class="bordered" width="7%"/>
                                    <td class="bordered" width="20%"/>
                                    <td class="bordered" width="17%"/>
                                    <td class="bordered" width="2%"/>
                                    <td class="bordered" width="2%"/>
                                    <td class="bordered" width="2%"/>
                                    <td class="bordered" width="33%"/>
                                    <td class="bordered" width="2%"/>
                                    <td class="bordered" width="15%"><xsl:text>Стр. № 1/1</xsl:text></td>
                                 </tr>
                                 <tr>
                                    <td colspan="3" class="bordered">
										<xsl:text>1. Название судна</xsl:text>
										<br/>
										<xsl:value-of select="deccr:ShipName"/>
                                    </td>
                                    <td colspan="4" class="bordered">
										<xsl:text>2. Предметы, которые подлежат или подтверждению на запрещение, или ограничению</xsl:text>
                                    </td>
                                    <td colspan="2" class="bordered"/>
                                 </tr>
                                 <tr>
                                    <td colspan="3" class="bordered">
										<xsl:text>3. Национальная принадлежность судна</xsl:text>
										<br/>
										<xsl:value-of select="deccr:NationalityVessel"/>
                                    </td>
                                    <td class="bordered"/>
                                    <td class="bordered"/>
                                    <td class="bordered"/>
                                    <td class="bordered"/>
                                    <td colspan="2" class="bordered"/>
                                 </tr>
                                 <tr>
                                    <td class="bordered"><xsl:text>4. №</xsl:text></td>
                                    <td class="bordered"><xsl:text>5. Фамилия, имя</xsl:text></td>
                                    <td class="bordered"><xsl:text>6. Должность</xsl:text></td>
                                    <td class="bordered"/>
                                    <td class="bordered"/>
                                    <td class="bordered"/>
                                    <td class="bordered"/>
                                    <td colspan="2" class="bordered"><xsl:text>7. Подпись</xsl:text></td>
                                 </tr>
                                 <xsl:for-each select="deccr:CrewInfo">
									 <tr>
										<td class="bordered"><xsl:value-of select="position()"/></td>
										<td class="bordered">
											<xsl:value-of select="deccr:PersonSignature/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="deccr:PersonSignature/cat_ru:PersonName"/>
											<xsl:if test="deccr:PersonSignature/cat_ru:PersonMiddleName">
												<xsl:text> </xsl:text>
												<xsl:value-of select="deccr:PersonSignature/cat_ru:PersonMiddleName"/>
											</xsl:if>
										</td>
										<td class="bordered"><xsl:value-of select="deccr:PersonSignature/cat_ru:PersonPost"/></td>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered"><xsl:apply-templates select="deccr:Subject"/>
										</td>
										<td colspan="2" class="bordered">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="deccr:PersonSignature/cat_ru:IssueDate"/>
											</xsl:call-template>
										</td>
									 </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
						  <xsl:text>8. Дата и подпись капитана, уполномоченного агента или лица командного состава.</xsl:text>
						  <br/>
							<xsl:value-of select="deccr:CaptainSignature/cat_ru:PersonSurname"/> 
							<xsl:value-of select="deccr:CaptainSignature/cat_ru:PersonName"/> 
							<xsl:value-of select="deccr:CaptainSignature/cat_ru:PersonMiddleName"/>     
							<xsl:call-template name="russian_date">
								  <xsl:with-param name="dateIn" select="deccr:CaptainSignature/cat_ru:IssueDate"/>
							</xsl:call-template>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
