<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:arcc="urn:customs.ru:Information:CustomsDocuments:ApplicationInterestPayment:5.28.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<!-- Шаблон для типа ApplicationInterestPaymentType -->
	<xsl:template match="arcc:ApplicationInterestPayment">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                  
                  .inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<xsl:text>В </xsl:text>
					<table class="inlinetable" style="min-width: 80mm; width: 80mm;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="arcc:Customs/*" mode="splitComma"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(наименование таможенного органа Российской Федерации<sup>1</sup>)
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Заявление о выплате процентов</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="35%">
									<table class="inlinetable" style="min-width: 100%; width: 100%;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="arcc:DocDate" mode="russian_date"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(дата заявления)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="30%"></td>
								<td width="35%">
									<xsl:text>№ </xsl:text>
									<table class="inlinetable" style="min-width: 90%; width: 90%;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="arcc:DocNumber"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(номер заявления)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="inlinetable" style="min-width: 100%; width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="arcc:ApplicantInfo/RUScat_ru:OrganizationName"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(наименование юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя, подавшего заявление)
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text>Идентификационный номер налогоплательщика</xsl:text>
					<table class="inlinetable" style="min-width: 100%; width: 10%mm;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="arcc:ApplicantInfo/*[local-name() = 'RFOrganizationFeatures']"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(для лиц, состоящих на учете в налоговых органах Российской Федерации)
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text>или наименование страны и регистрационный номер (код налогоплательщика (налоговый номер) или его аналог) в стране регистрации</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="arcc:ApplicantInfo" mode="IINorAnalog"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(для лиц, не состоящих на учете в налоговых органах Российской Федерации)
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text>в соответствии с положениями Федерального закона</xsl:text><sup>2</sup><xsl:text> просит (выбрать нужное):</xsl:text>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr valign="top" align="left">
								<td width="5%">
									<span style="display: inline-block; width: 4mm; height: 4mm; border: 1px solid black; text-align: center;">
										<xsl:if test="arcc:PaymentTypeIndicator = 0 or translate(substring(arcc:PaymentTypeIndicator, 1, 1), 'f', 'F') = 'F'">X</xsl:if>
									</span>
								</td>
								<td>
									<xsl:text> зачесть в счет авансовых платежей на лицевой счет;</xsl:text>
								</td>
							</tr>
							<tr>
								<td>или</td>
							</tr>
							<tr valign="top" align="left">
								<td width="5%">
									<span style="display: inline-block; width: 4mm; height: 4mm; border: 1px solid black; text-align: center;">
										<xsl:if test="arcc:PaymentTypeIndicator = 1 or translate(substring(arcc:PaymentTypeIndicator, 1, 1), 't', 'T') = 'T'">X</xsl:if>
									</span>
								</td>
								<td>
									<xsl:text> зачислить денежные средства на банковский счет № </xsl:text>
									<table class="inlinetable" style="min-width: 99%; width: 99%;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="arcc:BankAccountInfo/cat_ru:BankAccount" mode="splitComma"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(указывается номер банковского счета)
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text>, открытый в </xsl:text>
									<table class="inlinetable" style="min-width: 100%; width: 100%mm;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="arcc:BankAccountInfo/cat_ru:BankName"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(наименование кредитной организации)
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text> БИК </xsl:text>
									<table class="inlinetable" style="min-width: 50%; width: 50%mm;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="arcc:BankAccountInfo/cat_ru:BICID"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(банковский идентификационный код кредитной организации)
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text>проценты, подлежащие выплате (выбрать нужное):</xsl:text>
									<br/>
									<br/>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td width="5%">
									<span style="display: inline-block; width: 4mm; height: 4mm; border: 1px solid black; text-align: center;">
										<xsl:if test="arcc:ReturnAdvanceTermViolationIndicator = 1 or translate(substring(arcc:ReturnAdvanceTermViolationIndicator, 1, 1), 't', 'T') = 'T'">X</xsl:if>
									</span>
								</td>
								<td>
									<xsl:text> за нарушение срока возврата авансовых платежей (статья 36 Федерального закона);</xsl:text>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td width="5%">
									<span style="display: inline-block; width: 4mm; height: 4mm; border: 1px solid black; text-align: center;">
										<xsl:if test="arcc:OverchargedIndicator = 1 or translate(substring(arcc:OverchargedIndicator, 1, 1), 't', 'T') = 'T'">X</xsl:if>
									</span>
								</td>
								<td>
									<xsl:text> на сумму излишне взысканных таможенных пошлин, налогов, таможенных пошлин и (или) внутренних налогов в отношении товаров электронной торговли и иных платежей, взимание которых возложено на таможенные органы (статья 67 Федерального закона);</xsl:text>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td width="5%">
									<span style="display: inline-block; width: 4mm; height: 4mm; border: 1px solid black; text-align: center;">
										<xsl:if test="arcc:ReturnOverchargedTermViolationIndicator = 1 or translate(substring(arcc:ReturnOverchargedTermViolationIndicator, 1, 1), 't', 'T') = 'T'">X</xsl:if>
									</span>
								</td>
								<td>
									<xsl:text> за нарушение сроков возврата (зачета) излишне уплаченных таможенных пошлин, налогов, таможенных пошлин и (или) внутренних налогов в отношении товаров электронной торговли и иных платежей, взимание которых возложено на таможенные органы (статья 67 Федерального закона);</xsl:text>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td width="5%">
									<span style="display: inline-block; width: 4mm; height: 4mm; border: 1px solid black; text-align: center;">
										<xsl:if test="arcc:ReturnDutiesTermViolationIndicator = 1 or translate(substring(arcc:ReturnDutiesTermViolationIndicator, 1, 1), 't', 'T') = 'T'">X</xsl:if>
									</span>
								</td>
								<td>
									<xsl:text> за нарушение сроков возврата (зачета) таможенных пошлин, налогов, таможенных пошлин и (или) внутренних налогов в отношении товаров электронной торговли и иных денежных средств (денег) (статья 68 Федерального закона);</xsl:text>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td width="5%">
									<span style="display: inline-block; width: 4mm; height: 4mm; border: 1px solid black; text-align: center;">
										<xsl:if test="arcc:ReturnDepositTermViolationIndicator = 1 or translate(substring(arcc:ReturnDepositTermViolationIndicator, 1, 1), 't', 'T') = 'T'">X</xsl:if>
									</span>
								</td>
								<td>
									<xsl:text> за нарушение срока возврата денежного залога (статья 69 Федерального закона);</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text>в размере </xsl:text>
					<xsl:apply-templates select="arcc:Amount"/>
					<xsl:text>, </xsl:text>
					<br/>
					<br/>
					<xsl:text>рассчитанные в уведомлении таможенного органа о сумме подлежащих выплате процентов на суммы излишне взысканных сумм таможенных пошлин, налогов, таможенных пошлин и (или) внутренних налогов в отношении товаров электронной торговли и иных платежей, взимание которых возложено на таможенные от органы от </xsl:text>
					<span style="display: inline-block; width: 40mm; border-bottom: 1px solid black; text-align: center;">
						<xsl:apply-templates select="arcc:CustomsNotifDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
					</span>
					<xsl:text> № </xsl:text>
					<span style="display: inline-block; width: 40mm; border-bottom: 1px solid black; text-align: center;">
						<xsl:apply-templates select="arcc:CustomsNotifDocument/cat_ru:PrDocumentNumber"/>
					</span>
					<br/>
					<xsl:text>по </xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="arcc:AttachedDocuments" mode="splitComma"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(документ, подтверждающий факт излишней уплаты (взыскания) сумм таможенных пошлин, налогов, таможенных пошлин и (или) внутренних налогов в отношении товаров электронной  торговли и иных платежей, взимание которых  возложено на таможенные органы, заявление о возврате авансовых платежей или таможенная расписка)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="bottom">
								<td width="45%"></td>
								<td width="10%"></td>
								<td width="45%">
									<xsl:apply-templates select="arcc:ApplicantSignature/*[contains(local-name(), 'ame')]" mode="splitSpace"/>
								</td>
							</tr>
							<tr>
								<td class="descr" style="border-top: 1px solid black;">(подпись руководителя юридического лица, индивидуального предпринимателя либо физического лица)</td>
								<td></td>
								<td class="descr" style="border-top: 1px solid black;">фамилия, имя, отчество (при наличии)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div style="width: 30%; text-align: center">
						<xsl:text>М.П</xsl:text>
						<br/>
						<span class="descr">
							<xsl:text>(если в соответствии с законодательством Российской Федерации лицо, подавшее заявление, имеет печать)</xsl:text>
						</span>
					</div>
					
					<br/>
					<br/>
					<br/>
					<div class="descr" style="text-align: left;">
						<sup>1</sup><xsl:text> Далее - таможенный орган</xsl:text>
						<br/>
						<sup>2</sup><xsl:text> Фдереальный закон от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" (далее - Федеральный закон)</xsl:text>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="arcc:AttachedDocuments">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="arcc:Amount">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			
			<xsl:variable name="rub">
				<xsl:choose>
					<xsl:when test="string-length(substring-before(., '.')) = 0">0</xsl:when>
					<xsl:otherwise><xsl:value-of select="substring-before(., '.')"/></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:variable name="kop">
				<xsl:choose>
					<xsl:when test="string-length(substring-after(., '.')) = 0">00</xsl:when>
					<xsl:otherwise><xsl:value-of select="substring-after(., '.')"/></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
				
			<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black; text-align: center;">
				<xsl:value-of select="format-number($rub, '0')"/>
			</span>
			<xsl:text> рублей </xsl:text>
			<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black; text-align: center;">
				<xsl:value-of select="format-number($kop, '00')"/>
			</span>
			<xsl:text> копеек</xsl:text>		
			
			
		</element>
	</xsl:template>
	
	<xsl:template match="arcc:ApplicantInfo" mode="IINorAnalog">
		<xsl:apply-templates select="*[local-name() = 'CountryA2Code']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RKOrganizationFeatures']"/>
		<xsl:apply-templates select="*[local-name() = 'RBOrganizationFeatures']"/>
		<xsl:apply-templates select="*[local-name() = 'RAOrganizationFeatures']"/>
		<xsl:apply-templates select="*[local-name() = 'KGOrganizationFeatures']"/>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'KGOrganizationFeatures']">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text> ИНН/ПИН </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'RAOrganizationFeatures']">
		<xsl:if test="cat_ru:UNN">
			<xsl:text> УНН </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'RBOrganizationFeatures']">
		<xsl:if test="cat_ru:UNP">
			<xsl:text> УНП </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> УНФЛ </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'RFOrganizationFeatures']">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'RKOrganizationFeatures']">
		<xsl:if test="cat_ru:BIN">
			<xsl:text> БИН </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text> ИИН </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="personFIO">
		<xsl:apply-templates select="*[contains(local-name(), 'ame')]" mode="splitSpace"/>
	</xsl:template>
	
	<xsl:template match="*" mode="splitComma">
		<xsl:if test="position() != 1">, </xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	
	<xsl:template match="*" mode="personFamilyIO">
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring(*[local-name() = 'PersonName'], 1, 1)"/>
		<xsl:text>.</xsl:text>
		<xsl:if test="*[local-name() = 'PersonMiddleName']">
			<xsl:value-of select="substring(*[local-name() = 'PersonMiddleName'], 1, 1)"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="splitSpace">
		<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="splitCR">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="*[local-name() != 'AddressText']" mode="splitComma"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*[local-name() = 'AddressKindCode']">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">Адрес регистрации</xsl:when>
				<xsl:when test=". = 2">Фактический адрес</xsl:when>
				<xsl:when test=". = 3">Почтовый адрес</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>

	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ApplicationInterestPayment']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
