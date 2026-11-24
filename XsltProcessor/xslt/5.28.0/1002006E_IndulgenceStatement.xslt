<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:is="urn:customs.ru:Information:CommercialFinanceDocuments:IndulgenceStatement:5.24.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template name="russian_date2">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="is:IndulgenceStatement">
      <html>
         <head>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <title>Заявление о предоставлении отсрочки (рассрочки) уплаты таможенных платежей</title>
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
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
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
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
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
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold" style="width:190mm">
									Заявление<br/> о предоставлении отсрочки (рассрочки) уплаты таможенных платежей<br/> от 
									<span class="bold2">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="is:IndulgenceStatementRegistration/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </span>г. №
									<span class="bold2">
                              <xsl:value-of select="is:IndulgenceStatementRegistration/cat_ru:PrDocumentNumber"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:190mm">
                           <xsl:value-of select="is:Declarant/cat_ru:OrganizationName"/>
                           <xsl:if test="is:Declarant/cat_ru:ShortName">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="is:Declarant/cat_ru:ShortName"/>)
									</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:190mm">
								(полное наименование организации (фамилия инициалы индивидуального предпринимателя), 
								</td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:190mm">
                           <xsl:apply-templates select="is:Declarant"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:190mm">
								место нахождения (место жительства), телефон)
								</td>
                     </tr>
                     <xsl:if test="is:Declarant/is:NaturalPersonRegistration">
                        <tr>
                           <td align="center" class="normal" style="width:190mm">
                              <xsl:value-of select="is:Declarant/is:NaturalPersonRegistration/is:RegistrationOrganization"/> 
								<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="is:Declarant/is:NaturalPersonRegistration/is:DateInf"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graphLittle" style="width:190mm">
								( наименование регистрирующего органа и дата свидетельства о регистрации в качестве индивидуального предпринимателя,
								</td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="is:Declarant/is:JuridicalPersonRegistration">
                        <tr>
                           <td align="center" class="normal" style="width:190mm">		
								серия <xsl:value-of select="is:Declarant/is:JuridicalPersonRegistration/is:CertificateSeriesCode"/> 
								номер
								<xsl:value-of select="is:Declarant/is:JuridicalPersonRegistration/is:CertificateNumber"/> 
								дата <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="is:Declarant/is:JuridicalPersonRegistration/is:DateInf"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                        <td align="center" class="graphLittle" style="width:190mm">
								( серия, номер и дата свидетельства о регистрации юридического лица,
								</td>
                        <tr>
                           <td align="center" class="normal" style="width:190mm">
                              <xsl:value-of select="is:Declarant/is:JuridicalPersonRegistration/is:RegistrationOrganization"/> 
								<xsl:value-of select="is:Declarant/is:JuridicalPersonRegistration/is:Place"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graphLittle" style="width:190mm">
								 наименование исполнительного органа, выдавшего свидетельство, место регистрации)
								</td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="left" class="graphMain" style="width:190mm">		
							просит предоставить отсрочку (рассрочку) уплаты таможенных платежей
						</td>
					</tr>
					<xsl:for-each select="is:Payment">
						<tr>
							<td>
							в сумме <span class="normal">
								  <xsl:value-of select="is:Amount"/> <xsl:value-of select="is:CurrencyCode"/>, 
										<xsl:value-of select="is:CustomsPaymentModeCode"/>
							   </span>
							</td>
						 </tr>
						 <tr>
							<td align="left" class="graphMain" style="width:190mm">		
								на срок по <span class="normal">
								  <xsl:call-template name="russian_date">
									 <xsl:with-param name="dateIn" select="is:DateInf"/>
								  </xsl:call-template> г. </span>
							</td>
						 </tr>
						 <tr>
							<td align="left" class="graphMain" style="width:190mm">		
									В качестве обеспечения уплаты таможенных платежей представлены:
								</td>
						 </tr>
						 <tr>
							<td align="left" class="normal" style="width:190mm">
							   <xsl:value-of select="is:SecurityText"/>
							</td>
						 </tr>
					 </xsl:for-each>
                     <tr>
                        <td align="left" class="graphMain" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" style="width:190mm">
								Контракт: 
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="normal" style="width:190mm">
                           <xsl:value-of select="is:ContractRegistration/cat_ru:PrDocumentName"/>
                           <xsl:if test="is:ContractRegistration/cat_ru:PrDocumentNumber"> №
							<xsl:value-of select="is:ContractRegistration/cat_ru:PrDocumentNumber"/>
                           </xsl:if>
                           <xsl:if test="is:ContractRegistration/cat_ru:PrDocumentDate"> с 
							<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="is:ContractRegistration/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </xsl:if>
                           <xsl:if test="is:ContractTerms/is:LastDate"> по 
							<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="is:ContractTerms/is:LastDate"/>
                              </xsl:call-template>
                           </xsl:if>
                           <xsl:if test="is:ContractTerms/is:CurrencyCode"> в валюте
							<xsl:value-of select="is:ContractTerms/is:CurrencyCode"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="normal" style="width:190mm">
                           <xsl:value-of select="is:IndulgenceStatementContractor/is:Name"/>,
							<xsl:value-of select="is:IndulgenceStatementContractor/is:CountryCode"/>,
							<xsl:value-of select="is:IndulgenceStatementContractor/is:RegistrationPlace"/>
                           <xsl:if test="is:IndulgenceStatementContractor/is:RegistrationPlace">,
							<xsl:value-of select="is:IndulgenceStatementContractor/is:GoodsCountryCode"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:190mm">
                           <span class="graph"> Банк: <br/>
                           </span>
								Полное название: <xsl:value-of select="is:DeclarantBank/cat_ru:OrganizationName"/>
                           <br/>
								Телефон: <xsl:value-of select="is:DeclarantBank/is:Phone"/>
                           <br/>
								Телефакс: <xsl:value-of select="is:DeclarantBank/is:Fax"/>
                           <br/>
								Корреспондентский счет: <xsl:value-of select="is:DeclarantBank/is:AccountNumeric"/>
                           <br/>
								БИК: <xsl:value-of select="is:DeclarantBank/is:BICID"/>
                           <br/>
								ИНН: <xsl:value-of select="is:DeclarantBank/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           <br/>
								КПП: <xsl:value-of select="is:DeclarantBank/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           <br/>
                           <xsl:for-each select="is:DeclarantBank">
								Юридический адрес: <xsl:apply-templates select="is:LegalAddress"/>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="is:Declarant">
      <xsl:if test="is:Address">
			<xsl:apply-templates select="is:Address"/>, 
		</xsl:if>
      <xsl:if test="is:Contact/cat_ru:Phone">
			тел.
			<xsl:value-of select="is:Contact/cat_ru:Phone"/>
      </xsl:if>
      <xsl:if test="is:Contact/cat_ru:Fax">
			факс: 
			<xsl:value-of select="is:Contact/cat_ru:Fax"/>
      </xsl:if>
      <xsl:if test="is:Contact/cat_ru:Telex">
			телекс
			<xsl:value-of select="is:Contact/cat_ru:Telex"/>
      </xsl:if>
   </xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="is:Address | is:LegalAddress">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<!--xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if-->
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<!--xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when-->
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="not(local-name()='AddressKindCode')">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
