<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:oeznr="urn:customs.ru:Information:CustomsDocuments:OEZ_NotifReg:5.26.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="oeznr:OEZ_NotifReg">
      <html>
         <head>
			 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
         </head>
         <body>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:large; font-weight:bold; ">
							<xsl:choose>
                              <xsl:when test="oeznr:DocKind='1'">Уведомление о ввозе товаров</xsl:when>
                              <xsl:when test="oeznr:DocKind='2'">Уведомление о вывозе товаров</xsl:when>
                              <xsl:when test="oeznr:DocKind='3'">Заявление на уничтожение товаров</xsl:when>
                              <xsl:when test="oeznr:DocKind='4'">Акт об уничтожении товаров</xsl:when>
                              <xsl:when test="oeznr:DocKind='5'">Опись документов, представленных в целях вывоза товаров ЕАЭС</xsl:when>
                              <xsl:when test="oeznr:DocKind='6'">Заявление об идентификации товаров</xsl:when>
                           </xsl:choose>
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="oeznr:ZoneKind = 1">ОЭЗ</xsl:when>
								<xsl:when test="oeznr:ZoneKind = 2">ПОЭЗ</xsl:when>
								<xsl:when test="oeznr:ZoneKind = 3">ТОР</xsl:when>
								<xsl:when test="oeznr:ZoneKind = 1">СЭЗ</xsl:when>
							</xsl:choose>
                           </span>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center"/>
                  </tr>
               </tbody>
            </table>
            <br/>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td width="131">
                        <table border="1">
                           <tbody>
                              <tr>
                                 <td align="center" width="110">
                                    <xsl:value-of select="oeznr:Customs/cat_ru:Code"/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                     <td>
                        <table border="1">
                           <tbody>
                              <tr>
                                 <td align="center" height="22" width="371">
                                    <xsl:value-of select="oeznr:Customs/cat_ru:OfficeName"/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
               </tbody>
            </table>
            <table>
               <tbody>
                  <tr>
                     <td>
                        <b>	Регистрационный номер <xsl:choose>
                              <xsl:when test="oeznr:DocKind='1'">уведомления о ввозе товаров</xsl:when>
                              <xsl:when test="oeznr:DocKind='2'">уведомления о вывозе товаров</xsl:when>
                              <xsl:when test="oeznr:DocKind='3'">заявления на уничтожение товаров</xsl:when>
                              <xsl:when test="oeznr:DocKind='4'">акта об уничтожении товаров</xsl:when>
                              <xsl:when test="oeznr:DocKind='5'">описи документов, представленных в целях вывоза товаров ЕАЭС</xsl:when>
                              <xsl:when test="oeznr:DocKind='6'">заявления об идентификации товаров</xsl:when>
                           </xsl:choose>
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="oeznr:ZoneKind = 1">ОЭЗ</xsl:when>
								<xsl:when test="oeznr:ZoneKind = 2">ПОЭЗ</xsl:when>
								<xsl:when test="oeznr:ZoneKind = 3">ТОР</xsl:when>
								<xsl:when test="oeznr:ZoneKind = 1">СЭЗ</xsl:when>
							</xsl:choose>
                           </b>
                        <u>
                        <xsl:text> </xsl:text>
                           <!--<xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
									</xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>-->
                           <xsl:choose>
                              <xsl:when test="oeznr:DocKind='1'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
                                 </u>
                              </xsl:when>
                              <xsl:when test="oeznr:DocKind='2'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
                                 </u>
                              </xsl:when>
                              <xsl:when test="oeznr:DocKind='3'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
									<xsl:text> ЗУН</xsl:text>
								</u>
                              </xsl:when>
                              <xsl:when test="oeznr:DocKind='4'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
									<xsl:text> АУ</xsl:text>
								</u>
                              </xsl:when>
                              <xsl:otherwise>
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>
                                    <xsl:text>/ </xsl:text>
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>
                                    <xsl:text>/ </xsl:text>
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
									<xsl:if test="oeznr:RegistrationNumber/oeznr:DocKind">
										<xsl:text>/ </xsl:text>
										<xsl:value-of select="oeznr:RegistrationNumber/oeznr:DocKind"/>
									</xsl:if>
								</u>
                              </xsl:otherwise>
                           </xsl:choose>
                        </u>
                     </td>
                  </tr>
               </tbody>
            </table>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center" width="422">
                        <xsl:value-of select="oeznr:CustomsPerson/cat_ru:PersonName"/>
                     </td>
                     <td width="123"/>
                     <td align="center">
                        <xsl:value-of select="oeznr:CustomsPerson/cat_ru:LNP"/>
                        <xsl:if test="oeznr:CustomsPerson/cat_ru:CustomsCode">
							<xsl:text> (код ТО: </xsl:text>
							<xsl:value-of select="oeznr:CustomsPerson/cat_ru:CustomsCode"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" width="422">
                        <hr color="black" size="1"/>Уполномоченное должностное лицо таможенного органа</td>
                     <td width="123"/>
                     <td align="center">
                        <hr color="black" size="1"/>ЛНП</td>
                  </tr>
               </tbody>
            </table>
            <br/>  <br/>
         </body>
      </html>
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
      <xsl:param name="date"/>
      <xsl:choose>
         <xsl:when test="substring($date,5,1)='-' and substring($date,8,1)='-'">
            <xsl:value-of select="substring($date,9,2)"/>
            <xsl:value-of select="substring($date,6,2)"/>
            <xsl:value-of select="substring($date,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$date"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
