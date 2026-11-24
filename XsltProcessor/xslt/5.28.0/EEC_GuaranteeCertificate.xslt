<?xml version="1.0" encoding="utf-8"?>
<!--Решение Коллегии Евразийской экономической комиссии от 24 октября 2023 года N 151-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:csdo="urn:EEC:M:CA:SimpleDataObjects:v1.10.0" 
	xmlns:ccdo="urn:EEC:M:CA:ComplexDataObjects:v1.10.0" 
	xmlns:casdo="urn:EEC:M:CA:SimpleDataObjects:v1.10.0" 
	xmlns:cacdo="urn:EEC:M:CA:ComplexDataObjects:v1.10.0" 
	xmlns:gcs="urn:EEC:R:044:GuaranteeCertificate:v2.0.0" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	
	<xsl:param name="TYPE"/><!-- типы ТС -->

	<xsl:variable name="k" select="1"/>
	<xsl:template match="gcs:GuaranteeCertificate">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
					body
					{background: #CCCCCC;
					font-size: 9pt;}

					div.page
					{width: 210mm;
					margin: 10px auto;
					padding: 5mm 10mm;
					background: white;
					border: solid 1px black;
					page-break-before: always;}

					div.page_album
					{width: 297mm;
					margin: 10px auto;
					padding: 10mm;
					background: white;
					border: solid 1px black;
					page-break-before: always;}

					div.page.nobreak
					{page-break-before: avoid;}

					/*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
					@media print
					{div.page {border: none;
					margin: 0;
					padding: 0;}}

					div.goods
					{background: white;}

					.bordered
					{border: solid 1px black;
					padding-top: 4pt;
					padding-bottom: 4pt;
					font-family: Arial;
					font-size: 9pt;}

					.border_top
					{border-top: 1px solid black;
					border-right: 1px solid black;
					border-left: 1px solid black;}

					.border_vertical
					{border-right: 1px solid black;
					border-left: 1px solid black;}

					.border_3
					{border-right: 1px solid black;
					border-left: 1px solid black;
					border-bottom: 1px solid black;}

					.underlined
					{border-bottom: solid 0.8pt black;}

					p.NumberDate
					{font-weight: bold;}

					.graph
					{font-family: Arial;
					font-size: 7pt;}

					.graphColumn
					{font-family: Arial;
					font-size: 6.5pt;}

					.graphTitleIt
					{font-family: Arial;
					font-size: 7pt;
					font-style: italic;}

					.graphMain
					{font-family: Arial;
					font-size: 9pt;
					font-weight: bold;}

					.graphNum
					{font-family: Arial;
					font-size: 7pt;
					font-weight: bold;}

					.graphNo
					{font-size: 7pt;
					font-weight: bold;}

					h1
					{font-size: 12pt;}

					table.addInfo
					{border-collapse: collapse;
					vertical-align: top;}

					table.addInfo th
					{border: 1px solid black;
					background-color: LightGrey;}

					table.addInfo td
					{border: 1px solid black;
					vertical-align: top;}

					hr
					{border: 0;
					border-bottom: 1px solid black;
					margin: 0;}

					.tr
					{border-right: 1px solid black;}

					.tl
					{border-left: 1px solid black;}

					.tb
					{border-bottom: 1px solid black;}

					.tt
					{border-top: 1px solid black;}

					.br
					{border-right: 2px solid black;}

					.bl
					{border-left: 2px solid black;}

					.bb
					{border-bottom: 2px solid black;}

					.bt
					{border-top: 2px solid black;}

					.db
					{border-bottom: 1px dashed black;}

					.dl
					{border-left: 1px dashed black;}

					.number
					{text-align: center;
					color: black;
					font-size: 11pt;
					font-weight: bold;
					vertical-align: middle;}
                </style>
			</head>
			<body>
				<div class="page">
					<table class="graph" cellpadding="4" width="100%">
						<tbody>
							<tr>
								<td width="20%"/>
								<td width="30%"/>
								<td width="10%"/>
								<td width="15%"/>
								<td width="25%"/>
							</tr>
							<tr>
								<td class="graph bordered" align="center" colspan="5">
									<b>
										<xsl:text>СЕРТИФИКАТ</xsl:text>
										<br>
											<xsl:text>обеспечения исполнения обязанности по уплате таможенных пошлин, налогов</xsl:text>
										</br>
									</b>
								</td>
							</tr>
							<tr>
								<td valign="top" class="graph bordered" colspan="4" align="left">
									<b><xsl:text>А. Регистрационный номер</xsl:text></b>
									<br/>
									<span class="value">
										<br>
											<!--xsl:apply-templates select="casdo:GuaranteeCertificateIdDetails" mode="gtd_num"/-->
										</br>
									</span>
								</td>
								<td class="graph bordered" align="left">
									<b><xsl:text>B. Дата окончания срока</xsl:text></b>
									<br>
										<xsl:text>действия</xsl:text>
									</br>
									<span class="value">
										<br>
											<xsl:apply-templates select="csdo:EndDate" mode="russian_date2"/>
										</br>
									</span>
								</td>
							</tr>
							<tr>
								<td valign="top" class="graph bordered" align="left">
									<b><xsl:text>1. Сертификат</xsl:text></b>
									<span class="value">
										<br>
											<xsl:apply-templates select="casdo:EDocIndicatorCode"/>
										</br>
									</span>
								</td>
								<td class="graph bordered" colspan="4" align="left">
									<b><xsl:text>2. Лицо, предоставившее обеспечение</xsl:text></b>
									<span class="value">
										<br>
											<xsl:apply-templates mode="org" select="cacdo:SuretySubjectDetails"/>
										</br>
									</span>
								</td>
							</tr>
							<tr>
								<td class="border_top" colspan="4" align="left">
									<b><xsl:text>3. Сведения о предоставленном обеспечении</xsl:text></b>
								</td>
								<td class="border_top" align="left">
									<b><xsl:text>4. Сумма сертификата</xsl:text></b>
								</td>
							</tr>
							<tr>
								<td valign="top" class="border_3" align="left">
									<xsl:text>Код способа обеспечения</xsl:text>
									<span class="value">
										<br>
											<xsl:apply-templates select="casdo:PaymentGuaranteeMethodCode"/>
										</br>
									</span>
								</td>
								<td class="border_3" colspan="3" align="left">
									<xsl:text>Реквизиты документа, подтверждающего обеспечения предоставление</xsl:text>
									<span class="value">
										<br>
											<xsl:for-each select="cacdo:GCGuaranteeConfirmDocDetails">
												<xsl:if test="position()!=1">
													<br/>
												</xsl:if>
												<xsl:apply-templates mode="docNumDate" select="."/>
												<xsl:if test="casdo:IncomingDocId">
													<xsl:text> рег. номер </xsl:text>
													<xsl:apply-templates select="casdo:IncomingDocId"/>
												</xsl:if>
												<xsl:if test="position()!=last()">
													<xsl:text>;</xsl:text>
												</xsl:if>
											</xsl:for-each>
										</br>
									</span>
								</td>
								<td class="border_3">
									<span class="value">
										<xsl:apply-templates select="casdo:GuaranteeAmount" mode="format_number_2"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="casdo:GuaranteeAmount/@currencyCode"/>
									</span>
								</td>
							</tr>
							<tr>
								<td valign="top" class="graph bordered" colspan="3" align="left">
									<b><xsl:text>5. Декларант</xsl:text></b>
									<br/>
									<span class="value">
										<xsl:choose>
											<xsl:when test="cacdo:TransitDeclarantDetails/casdo:EqualIndicator='1' or cacdo:TransitDeclarantDetails/casdo:EqualIndicator='t' or cacdo:TransitDeclarantDetails/casdo:EqualIndicator='true'">
												<xsl:text>См. графу 2</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="cacdo:TransitDeclarantDetails" mode="org"/>
											</xsl:otherwise>
										</xsl:choose>
										<br/>
									</span>
								</td>
								<td valign="top" class="graph bordered" colspan="2" align="left">
									<b><xsl:text>6. Сведения о коммерческих и транспортных (перевозочных) документах</xsl:text></b>
									<br/>
									<span class="value">
										<xsl:for-each select="ccdo:DocV4Details">
											<xsl:if test="position()!=1">
												<br/>
											</xsl:if>	
											<xsl:if test="csdo:DocKindCode">
												<xsl:value-of select="csdo:DocKindCode"/>
												<xsl:text>-</xsl:text>
											</xsl:if>
											<xsl:apply-templates mode="docNumDate" select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text>;</xsl:text>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="casdo:GuaranteeCertificateCommodityCode">
											<br/>
											<xsl:text>1. </xsl:text>
											<xsl:for-each select="casdo:GuaranteeCertificateCommodityCode">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text>; </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="casdo:NonGuaranteeCertificateCommodityCode">
											<br/>
											<xsl:text>2. </xsl:text>
											<xsl:for-each select="casdo:NonGuaranteeCertificateCommodityCode">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text>; </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td class="graph bordered" colspan="2" align="left">
									<b><xsl:text>7. Государство таможенного органа отправления</xsl:text></b>
									<span class="value">
										<br>
											<xsl:for-each select="casdo:DepartureCountryCode">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text>; </xsl:text>
												</xsl:if>
											</xsl:for-each>	
										</br>
									</span>
								</td>
								<td class="graph bordered" colspan="3" align="left">
									<b><xsl:text>8. Регистрационный номер предшествующего сертификата</xsl:text></b>
									<span class="value">
										<br>
											<xsl:apply-templates select="cacdo:RefGuaranteeCertificateIdDetails" mode="gtd_num"/>
										</br>
									</span>
								</td>
							</tr>
							<tr>
								<td class="border_top" colspan="5" align="left">
									<b><xsl:text>9. Сведения о лице, представившем сертификат</xsl:text></b>
								</td>
							</tr>
							<tr>
								<td class="border_vertical" valign="top" colspan="2" align="left">
									<span class="value">
										<xsl:choose>
											<xsl:when test="cacdo:GuaranteeCertificateAgentDetails/casdo:EqualIndicator='1' or cacdo:GuaranteeCertificateAgentDetails/casdo:EqualIndicator='t' or cacdo:GuaranteeCertificateAgentDetails/casdo:EqualIndicator='true'  ">
												<xsl:text>См. графу 2</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="cacdo:GuaranteeCertificateAgentDetails" mode="org"/>
											</xsl:otherwise>
										</xsl:choose>
										<br/>
									</span>
								</td>
								<td class="border_vertical" valign="top" colspan="3" align="left">
									<span class="value">
										<xsl:apply-templates mode="personBase" select="cacdo:SignatoryPersonV2Details/cacdo:SigningDetails/ccdo:FullNameDetails"/>
										<xsl:for-each select="cacdo:SignatoryPersonV2Details">
											<xsl:if test="casdo:SignatoryPersonIdentityDetails">
												<br>
													<xsl:apply-templates mode="identity" select="casdo:SignatoryPersonIdentityDetails"/>
												</br>
											</xsl:if>
											<br>
												<xsl:apply-templates select="cacdo:SigningDetails/csdo:PositionName"/>
											</br>
											<br>
												<xsl:for-each select="cacdo:SigningDetails/ccdo:CommunicationDetails">
													<xsl:apply-templates mode="сommunication" select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>; </xsl:text>
													</xsl:if>
												</xsl:for-each>
											</br>
											<xsl:if test="cacdo:PowerOfAttorneyDetails">
												<br>
													<xsl:if test="cacdo:PowerOfAttorneyDetails/csdo:DocKindCode">
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="cacdo:PowerOfAttorneyDetails/csdo:DocKindCode"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:apply-templates mode="docBase" select="cacdo:PowerOfAttorneyDetails"/>
													<xsl:if test="cacdo:PowerOfAttorneyDetails/csdo:DocValidityDate">
														<xsl:text> (окончание срока действия: </xsl:text>
														<xsl:apply-templates select="cacdo:PowerOfAttorneyDetails/csdo:DocValidityDate" mode="russian_date2"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</br>
											</xsl:if>
											<br/>
										</xsl:for-each>
									</span>
								</td>
							</tr>
							<tr>
								<td class="border_3" colspan="2" align="left"/>
								<td class="border_3" valign="bottom" colspan="3" align="right">
									<span class="value">
										<xsl:apply-templates select="cacdo:SignatoryPersonV2Details/cacdo:SigningDetails/casdo:SigningDate" mode="russian_date2"/>
									</span>
								</td>
							</tr>
							<tr>
								<td class="border_top" colspan="2" align="left">
									<b><xsl:text>С. Отметки таможенного органа регистрации</xsl:text></b>
								</td>
								<td class="border_top" colspan="3" align="left">
									<b><xsl:text>D. Отметки таможенного органа отправления</xsl:text></b>
								</td>
							</tr>
							<tr>
								<td class="border_3" valign="top" colspan="2" align="left">
									<span class="value">
										<!--xsl:for-each select="casdo:GuaranteeCertificateMarkDetails">
											<xsl:choose>
												<xsl:when test="casdo:CustomsOperationCode='110' or casdo:CustomsOperationCode='120' or casdo:CustomsOperationCode='130' or casdo:CustomsOperationCode='140' or casdo:CustomsOperationCode='150'">
													<br/>
													<xsl:choose>
														<xsl:when test="casdo:CustomsOperationCode='110'">
															<xsl:if test="casdo:EventDateTime">
																<xsl:text>1.</xsl:text>
																<xsl:text>&#160;</xsl:text>
																<xsl:apply-templates select="casdo:EventDateTime" mode="russian_date2"/>
															</xsl:if>
														</xsl:when>
														<xsl:when test="casdo:CustomsOperationCode='120' and casdo:CustomsDecisionModeCode='90'">
															<xsl:text>2.</xsl:text>
															<xsl:text>&#160;</xsl:text>
															<xsl:if test="casdo:EventDateTime">
																<xsl:apply-templates select="casdo:EventDateTime" mode="russian_date2"/>
															</xsl:if>
															<xsl:if test="casdo:GCRejectReasonCode">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="casdo:GCRejectReasonCode"/>
															</xsl:if>
															<xsl:text>/В регистрации отказано</xsl:text>
														</xsl:when>
														<xsl:when test="casdo:CustomsOperationCode='130'">
															<xsl:text>3.</xsl:text>
															<xsl:text>&#160;</xsl:text>
															<xsl:if test="casdo:EventDateTime">
																<xsl:apply-templates select="casdo:EventDateTime" mode="russian_date"/>
															</xsl:if>
															<xsl:if test="casdo:GCRegistrationCancelReasonCode">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="casdo:GCRegistrationCancelReasonCode"/>
															</xsl:if>
															<xsl:if test="casdo:RefGuaranteeCertificateIdDetails">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates mode="gtd_num" select="casdo:RefGuaranteeCertificateIdDetails"/>
															</xsl:if>
															<xsl:text>/Аннулирование регистрации</xsl:text>
														</xsl:when>
														<xsl:when test="casdo:CustomsOperationCode='140'">
															<xsl:text>4.</xsl:text>
															<xsl:text>&#160;</xsl:text>
															<xsl:if test="casdo:EventDateTime">
																<xsl:apply-templates select="casdo:EventDateTime" mode="russian_date2"/>
															</xsl:if>
															<xsl:if test="casdo:GCCancellationReasonCode">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="casdo:GCCancellationReasonCode"/>
															</xsl:if>
															<xsl:text>/Прекращение действия (погашение)</xsl:text>
														</xsl:when>
														<xsl:when test="casdo:CustomsOperationCode='150' and casdo:CustomsDecisionModeCode='90'">
															<xsl:text>5.</xsl:text>
															<xsl:text>&#160;</xsl:text>
															<xsl:if test="casdo:EventDateTime">
																<xsl:apply-templates select="casdo:EventDateTime" mode="russian_date2"/>
															</xsl:if>
															<xsl:if test="casdo:GCChangeRejectReasonCode">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="casdo:GCChangeRejectReasonCode"/>
															</xsl:if>
															<xsl:text>/Во внесении изменений (дополнений) отказано</xsl:text>
														</xsl:when>
													</xsl:choose>
													<br>
														<xsl:apply-templates select="casdo:CustomsPersonDetails"/>
													</br>
												</xsl:when>
											</xsl:choose>
										</xsl:for-each-->
										<br/>
									</span>
								</td>
								<td class="border_3" valign="top" colspan="3" align="left">
									<span class="value">
										<!--xsl:for-each select="casdo:GuaranteeCertificateMarkDetails">
											<xsl:choose>
												<xsl:when test="casdo:CustomsOperationCode='220' or casdo:CustomsOperationCode='210'">
													<br/>
													<xsl:choose>
														<xsl:when test="casdo:CustomsOperationCode='220'">
															<s>
																<xsl:apply-templates select="casdo:CustomsDeclarationIdDetails" mode="gtd_num"/>
															</s>
															<xsl:if test="casdo:EventDateTime">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="casdo:EventDateTime" mode="russian_date2"/>
															</xsl:if>
															<xsl:if test="casdo:GCAcceptCancellationReasonCode">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="casdo:GCAcceptCancellationReasonCode"/>
															</xsl:if>
															<xsl:text>/Аннулировано</xsl:text>
														</xsl:when>
														<xsl:when test="casdo:CustomsOperationCode='210'">
															<xsl:apply-templates select="casdo:CustomsDeclarationIdDetails" mode="gtd_num"/>
														</xsl:when>
													</xsl:choose>
													<br>
														<xsl:apply-templates select="casdo:CustomsPersonDetails"/>
													</br>
												</xsl:when>
											</xsl:choose>
										</xsl:for-each-->
										<br/>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="*" mode="docBase">
		<xsl:if test="csdo:DocName">
			<xsl:apply-templates select="csdo:DocName"/>
		</xsl:if>
		<xsl:if test="csdo:DocId">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="csdo:DocId"/>
		</xsl:if>
		<xsl:if test="csdo:DocCreationDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="docNumDate">
		<!--xsl:apply-templates select="csdo:DocKindCode"/>
		<xsl:if test="csdo:DocKindCode and csdo:DocId">/</xsl:if-->
		<xsl:apply-templates select="csdo:DocId"/>
		<xsl:if test="csdo:DocCreationDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="csdo:SubjectName"/>
		<xsl:if test="not(csdo:SubjectName) and csdo:SubjectBriefName">
			<xsl:value-of select="csdo:SubjectBriefName"/>
		</xsl:if>
		<xsl:if test="ccdo:SubjectAddressDetails">
			<br/>
			<xsl:apply-templates select="ccdo:SubjectAddressDetails"/>
		</xsl:if>
		<xsl:if test="csdo:TaxpayerId or csdo:TaxRegistrationReasonCode or casdo:CAUniqueCustomsNumberId">
			<br/>
			<xsl:if test="csdo:TaxpayerId">
				<xsl:text>ИНН - </xsl:text>
				<xsl:apply-templates select="csdo:TaxpayerId"/>
			</xsl:if>
			<xsl:if test="csdo:TaxRegistrationReasonCode">
				<xsl:if test="csdo:TaxpayerId">
					<xsl:text>; </xsl:text>
				</xsl:if>
				<xsl:text>КПП - </xsl:text>
				<xsl:apply-templates select="csdo:TaxRegistrationReasonCode"/>
			</xsl:if>
			<xsl:if test="casdo:CAUniqueCustomsNumberId">
				<xsl:if test="csdo:TaxpayerId or casdo:CAUniqueCustomsNumberId">
					<xsl:text>; </xsl:text>
				</xsl:if>
				<xsl:text>ИТН / ОКПО / ОГРН - </xsl:text>
				<xsl:apply-templates select="casdo:CAUniqueCustomsNumberId"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="ccdo:CommunicationDetails">
			<br/>
			<xsl:apply-templates mode="сommunication" select="ccdo:CommunicationDetails"/>
		</xsl:if>
		<xsl:if test="ccdo:IdentityDocV3Details">
			<br/>
			<xsl:apply-templates select="ccdo:IdentityDocV3Details" mode="identity"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="personBase">
		<xsl:if test="csdo:LastName">
			<xsl:apply-templates select="csdo:LastName"/>
		</xsl:if>
		<xsl:if test="csdo:FirstName">
			<xsl:text>&#160;</xsl:text>
			<xsl:apply-templates select="csdo:FirstName"/>
		</xsl:if>
		<xsl:if test="csdo:MiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:apply-templates select="csdo:MiddleName"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="identity">
		<xsl:apply-templates select="csdo:DocKindName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="csdo:IdentityDocKindCode"/>
		<xsl:if test="csdo:IdentityDocKindCode">, </xsl:if>
		<xsl:apply-templates select="csdo:UnifiedCountryCode"/>
		<xsl:if test="csdo:DocSeriesId or csdo:DocId">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="csdo:DocSeriesId"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="csdo:DocId"/>
		</xsl:if>
		<xsl:if test="csdo:DocCreationDate">
			<xsl:text>, дата выдачи - </xsl:text>
			<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date2"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="сommunication">
		<xsl:if test="csdo:CommunicationChannelName">
			<xsl:apply-templates select="csdo:CommunicationChannelName"/>
		</xsl:if>
		<xsl:if test="not(csdo:CommunicationChannelName) and csdo:CommunicationChannelCode">
			<xsl:apply-templates select="csdo:CommunicationChannelCode"/>
		</xsl:if>
		<xsl:if test="csdo:CommunicationChannelId">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="csdo:CommunicationChannelId"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="ccdo:SubjectAddressDetails">
		<xsl:if test="position() != 1">; </xsl:if>
		<xsl:choose>
			<xsl:when test="csdo:AddressKindCode=1"> Адрес регистрации: </xsl:when>
			<xsl:when test="csdo:AddressKindCode=2"> Фактический адрес: </xsl:when>
			<xsl:when test="csdo:AddressKindCode=3"> Почтовый адрес: </xsl:when>
		</xsl:choose>
		<xsl:for-each select="*[local-name() != 'AddressKindCode']">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="*" mode="gtd_num">
		<xsl:apply-templates select="csdo:CustomsOfficeCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="casdo:GuaranteeCertificateRegId"/>
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
	<xsl:template name="russian_date2">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='GuaranteeCertificate']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date2">
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
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
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
	<xsl:template match="*" mode="format_number_2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.00')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
