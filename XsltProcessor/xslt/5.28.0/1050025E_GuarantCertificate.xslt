<?xml version="1.0" encoding="UTF-8"?>
<!--Решение Коллегии Евразийской экономической комиссии от 19 ноября 2019 года N 199-->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:guar_cer="urn:customs.ru:Information:GuaranteeDocuments:GuarantCertificate:5.24.0" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="guar_cer:GuarantCertificate">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>Сертификат обеспечения исполнения обязанности по уплате таможенных пошлин, налогов</title>
				<style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 180mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm 10mm 10mm 20mm;
						background: #ffffff;
						border: solid 1pt #000000;
						}

						table {
						width: 100%;
						empty-cells: show;
						border-collapse: collapse;
						margin-top: 1px;
						table-layout: fixed;
						word-wrap:break-word;
						word-break: break-word; 
						}

					.bordered {
						border: solid 1pt #000000;
						}
						

					.border_vertical
					{
					border-right: 1px solid black;
					border-left: 1px solid black;
					}

					.border_3
					{
					border-right: 1px solid black;
					border-left: 1px solid black;
					border-bottom: 1px solid black;
					}

						
					.underlined {
						border-bottom: solid 0.8pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 8pt;
						}
					td {
						font-family:Arial;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
	
					.value {
						font-style: italic;
						font-family: Arial;
						font-size: 8pt;
						}		

					.delim_3 {
						height: 3pt;
					}

						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
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
									<xsl:text>СЕРТИФИКАТ</xsl:text>
									<br>
										<xsl:text>обеспечения исполнения обязанности по уплате таможенных пошлин, налогов</xsl:text>
									</br>
								</td>
							</tr>
							<tr>
								<td valign="top" class="graph bordered" colspan="4" align="left">
									<xsl:text>А. Регистрационный номер</xsl:text>
									<br/>
									<span class="value">
										<br>
											<xsl:apply-templates select="guar_cer:GuaranteeCertificateIdDetails" mode="gtd_num"/>
										</br>
									</span>
								</td>
								<td class="graph bordered" align="left">
									<xsl:text>B. Дата окончания срока</xsl:text>
									<br>
										<xsl:text>действия</xsl:text>
									</br>
									<span class="value">
										<br>
											<xsl:apply-templates select="guar_cer:EndDate" mode="russian_date2"/>
										</br>
									</span>
								</td>
							</tr>
							<tr>
								<td valign="top" class="graph bordered" align="left">
									<xsl:text>1. Сертификат</xsl:text>
									<span class="value">
										<br>
											<xsl:apply-templates select="guar_cer:EDocIndicatorCode"/>
										</br>
									</span>
								</td>
								<td class="graph bordered" colspan="4" align="left">
									<xsl:text>2. Лицо, предоставившее обеспечение</xsl:text>
									<span class="value">
										<br>
											<xsl:apply-templates mode="org" select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:SuretySubjectDetails"/>
										</br>
									</span>
								</td>
							</tr>
							<tr>
								<td class="border_vertical" colspan="4" align="left">
									<xsl:text>3. Сведения о предоставленном обеспечении</xsl:text>
								</td>
								<td class="border_vertical" align="left">
									<xsl:text>4.Сумма сертификата</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="border_vertical" align="left">
									<xsl:text>Код способа обеспечения</xsl:text>
									<span class="value">
										<br>
											<xsl:apply-templates select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:PaymentGuaranteeMethodCode"/>
										</br>
									</span>
								</td>
								<td class="border_vertical" colspan="3" align="left">
									<xsl:text>Реквизиты документа, подтверждающего обеспечения предоставление</xsl:text>
									<span class="value">
										<br>
											<xsl:for-each select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:GCGuaranteeConfirmDocDetails">
												<xsl:if test="position()!=1">
													<br/>
												</xsl:if>	
												<xsl:for-each select="guar_cer:GuaranteeDocDetails">
													<xsl:apply-templates mode="docNumDate" select="."/>
												</xsl:for-each>
												<!--xsl:if test="guar_cer:DocV4Details">
													<xsl:text> - </xsl:text>
													<xsl:for-each select="guar_cer:DocV4Details">
														<xsl:apply-templates mode="docNumDate" select="."/>
													</xsl:for-each>
												</xsl:if-->
												<!--xsl:if test="guar_cer:GuaranteeAmount">
													<xsl:text>-</xsl:text>
													<xsl:value-of select="guar_cer:GuaranteeAmount/grn_cat:Amount"/>
													<xsl:text>&#160;</xsl:text>
													<xsl:value-of select="guar_cer:GuaranteeAmount/grn_cat:CurrencyCode"/>
												</xsl:if-->
												<xsl:if test="position()!=last()">
													<xsl:text>;</xsl:text>
												</xsl:if>
											</xsl:for-each>
										</br>
									</span>
								</td>
								<td class="border_vertical">
									<span class="value">
										<xsl:for-each select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:GuaranteeAmount">
											<xsl:apply-templates select="grn_cat:Amount" mode="translate_number"/>
											<xsl:if test="grn_cat:CurrencyCode">
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="grn_cat:CurrencyCode"/>
											</xsl:if>
										</xsl:for-each>
									</span>
								</td>
							</tr>
							<tr>
								<td class="graph bordered" colspan="3" align="left">
									<xsl:text>5. Декларант</xsl:text>
									<span class="value">
										<br>
											<xsl:apply-templates select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:TransitDeclarantDetails" mode="org"/>
										</br>
									</span>
								</td>
								<td valign="top" class="graph bordered" colspan="2" align="left">
									<xsl:text>6. Сведения о коммерческих и транспортных (перевозочных) документах</xsl:text>
									<br/>
									<span class="value">
										<xsl:for-each select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:DocV4Details">
											<xsl:if test="position()!=1">
												<br/>
											</xsl:if>	
											<!--xsl:if test="RUScat_ru:DocKindCode">
												<xsl:value-of select="RUScat_ru:DocKindCode"/>
												<xsl:text>-</xsl:text>
											</xsl:if-->
											<xsl:apply-templates mode="docNumDate" select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text>;</xsl:text>
											</xsl:if>
										</xsl:for-each>
									</span>
								</td>
							</tr>
							<tr>
								<td class="graph bordered" colspan="2" align="left">
									<xsl:text>7. Государство таможенного органа  отправления</xsl:text>
									<span class="value">
										<br>
											<xsl:apply-templates select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:DepartureCountryDetails/RUScat_ru:CountryCode"/>
										</br>
									</span>
								</td>
								<td class="graph bordered" colspan="3" align="left">
									<xsl:text>8. Регистрационный номер предшествующего сертификата</xsl:text>
									<span class="value">
										<br>
											<xsl:apply-templates select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:RefGuaranteeCertificateIdDetails" mode="gtd_num"/>
										</br>
									</span>
								</td>
							</tr>
							<tr>
								<td class="border_vertical" colspan="5" align="left">
									<xsl:text>9. Сведения о лице, представившем сертификат</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="border_vertical" colspan="2" align="left">
									<span class="value">
										<xsl:choose>
											<xsl:when test="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:GuaranteeCertificateAgentDetails/guar_cer:EqualIndicator='1' or guar_cer:GuaranteeCertificateInformationDetails/guar_cer:GuaranteeCertificateAgentDetails/guar_cer:EqualIndicator='t' or guar_cer:GuaranteeCertificateInformationDetails/guar_cer:GuaranteeCertificateAgentDetails/guar_cer:EqualIndicator='true'  ">
												<xsl:text>См. графу 2</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:GuaranteeCertificateAgentDetails" mode="org"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
								<td class="border_vertical" valign="top" colspan="3" align="left">
									<span class="value">
										<xsl:apply-templates mode="personBase" select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:SignatoryPersonV2Details/guar_cer:SigningDetails"/>
										<xsl:for-each select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:SignatoryPersonV2Details">
											<xsl:if test="guar_cer:SignatoryPersonIdentityDetails">
												<br>
													<xsl:apply-templates mode="identity" select="guar_cer:SignatoryPersonIdentityDetails"/>
												</br>
											</xsl:if>
											<br>
												<xsl:apply-templates select="guar_cer:SigningDetails/cat_ru:PersonPost"/>
											</br>
											<br>
												<xsl:apply-templates mode="сommunication" select="guar_cer:SigningDetails/RUScat_ru:CommunicationDetails"/>
											</br>
											<xsl:if test="guar_cer:PowerOfAttorneyDetails">
												<br>
													<xsl:if test="guar_cer:PowerOfAttorneyDetails/RUScat_ru:DocKindCode">
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="guar_cer:PowerOfAttorneyDetails/RUScat_ru:DocKindCode"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:apply-templates mode="docBase" select="guar_cer:PowerOfAttorneyDetails"/>
													<xsl:if test="guar_cer:PowerOfAttorneyDetails/RUScat_ru:DocValidityDate">
														<xsl:text> (окончание срока действия: </xsl:text>
														<xsl:apply-templates select="guar_cer:PowerOfAttorneyDetails/RUScat_ru:DocValidityDate" mode="russian_date2"/>
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
										<xsl:apply-templates select="guar_cer:GuaranteeCertificateInformationDetails/guar_cer:SignatoryPersonV2Details/guar_cer:SigningDetails/RUScat_ru:SigningDate" mode="russian_date2"/>
									</span>
								</td>
							</tr>
							<tr>
								<td class="border_vertical" colspan="2" align="left">
									<xsl:text>С. Отметки таможенного органа регистрации</xsl:text>
								</td>
								<td class="border_vertical" colspan="3" align="left">
									<xsl:text>D. Отметки таможенного органа отправления</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="border_3" valign="top" colspan="2" align="left">
									<span class="value">
										<xsl:for-each select="guar_cer:GuaranteeCertificateMarkDetails">
											<xsl:choose>
												<xsl:when test="guar_cer:CustomsOperationCode='110' or guar_cer:CustomsOperationCode='120' or guar_cer:CustomsOperationCode='130' or guar_cer:CustomsOperationCode='140' or guar_cer:CustomsOperationCode='150'">
													<br/>
													<xsl:choose>
														<xsl:when test="guar_cer:CustomsOperationCode='110'">
															<xsl:if test="guar_cer:EventDateTime">
																<xsl:text>1.</xsl:text>
																<xsl:text>&#160;</xsl:text>
																<xsl:apply-templates select="guar_cer:EventDateTime" mode="russian_date2"/>
															</xsl:if>
														</xsl:when>
														<xsl:when test="guar_cer:CustomsOperationCode='120' and guar_cer:CustomsDecisionModeCode='90'">
															<xsl:text>2.</xsl:text>
															<xsl:text>&#160;</xsl:text>
															<xsl:if test="guar_cer:EventDateTime">
																<xsl:apply-templates select="guar_cer:EventDateTime" mode="russian_date2"/>
															</xsl:if>
															<xsl:if test="guar_cer:GCRejectReasonCode">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="guar_cer:GCRejectReasonCode"/>
															</xsl:if>
															<xsl:text>/В регистрации отказано</xsl:text>
														</xsl:when>
														<xsl:when test="guar_cer:CustomsOperationCode='130'">
															<xsl:text>3.</xsl:text>
															<xsl:text>&#160;</xsl:text>
															<xsl:if test="guar_cer:EventDateTime">
																<xsl:apply-templates select="guar_cer:EventDateTime" mode="russian_date"/>
															</xsl:if>
															<xsl:if test="guar_cer:GCRegistrationCancelReasonCode">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="guar_cer:GCRegistrationCancelReasonCode"/>
															</xsl:if>
															<xsl:if test="guar_cer:RefGuaranteeCertificateIdDetails">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates mode="gtd_num" select="guar_cer:RefGuaranteeCertificateIdDetails"/>
															</xsl:if>
															<xsl:text>/Аннулирование регистрации</xsl:text>
														</xsl:when>
														<xsl:when test="guar_cer:CustomsOperationCode='140'">
															<xsl:text>4.</xsl:text>
															<xsl:text>&#160;</xsl:text>
															<xsl:if test="guar_cer:EventDateTime">
																<xsl:apply-templates select="guar_cer:EventDateTime" mode="russian_date2"/>
															</xsl:if>
															<xsl:if test="guar_cer:GCCancellationReasonCode">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="guar_cer:GCCancellationReasonCode"/>
															</xsl:if>
															<xsl:text>/Прекращение действия (погашение)</xsl:text>
														</xsl:when>
														<xsl:when test="guar_cer:CustomsOperationCode='150' and guar_cer:CustomsDecisionModeCode='90'">
															<xsl:text>5.</xsl:text>
															<xsl:text>&#160;</xsl:text>
															<xsl:if test="guar_cer:EventDateTime">
																<xsl:apply-templates select="guar_cer:EventDateTime" mode="russian_date2"/>
															</xsl:if>
															<xsl:if test="guar_cer:GCChangeRejectReasonCode">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="guar_cer:GCChangeRejectReasonCode"/>
															</xsl:if>
															<xsl:text>/Во внесении изменений (дополнений) отказано</xsl:text>
														</xsl:when>
													</xsl:choose>
													<br>
														<xsl:apply-templates select="guar_cer:CustomsPersonDetails"/>
													</br>
												</xsl:when>
											</xsl:choose>
										</xsl:for-each>
									</span>
								</td>
								<td class="border_3" valign="top" colspan="3" align="left">
									<span class="value">
										<xsl:for-each select="guar_cer:GuaranteeCertificateMarkDetails">
											<xsl:choose>
												<xsl:when test="guar_cer:CustomsOperationCode='220' or guar_cer:CustomsOperationCode='210'">
													<br/>
													<xsl:choose>
														<xsl:when test="guar_cer:CustomsOperationCode='220'">
															<s>
																<xsl:apply-templates select="guar_cer:CustomsDeclarationIdDetails" mode="gtd_num"/>
															</s>
															<xsl:if test="guar_cer:EventDateTime">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="guar_cer:EventDateTime" mode="russian_date2"/>
															</xsl:if>
															<xsl:if test="guar_cer:GCAcceptCancellationReasonCode">
																<xsl:text>/</xsl:text>
																<xsl:apply-templates select="guar_cer:GCAcceptCancellationReasonCode"/>
															</xsl:if>
															<xsl:text>/Аннулировано</xsl:text>
														</xsl:when>
														<xsl:when test="guar_cer:CustomsOperationCode='210'">
															<xsl:apply-templates select="guar_cer:CustomsDeclarationIdDetails" mode="gtd_num"/>
														</xsl:when>
													</xsl:choose>
													<br>
														<xsl:apply-templates select="guar_cer:CustomsPersonDetails"/>
													</br>
												</xsl:when>
											</xsl:choose>
										</xsl:for-each>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="cat_ru:ITN">
		<xsl:apply-templates select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<xsl:text>ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN)">
				<xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:text> КПП: </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<br>
				<xsl:text>ОГРН/ОГРНИП: </xsl:text>
				<xsl:apply-templates select="cat_ru:OGRN"/>
			</br>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text> код объекта: </xsl:text>
		<xsl:apply-templates select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> (код справочника: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:CodeListId"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:apply-templates select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:ITN">
		<xsl:apply-templates select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template mode="AdressStr" match="*">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>Код вида адреса:  <xsl:value-of select="RUScat_ru:AddressKindCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:text> &#160;</xsl:text>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
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
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and not(local-name()='IdentityCardSeries')">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='IdentityCardSeries'">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="сommunication" match="*">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:apply-templates select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:apply-templates select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:apply-templates select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">E-mail:<xsl:for-each select="cat_ru:E_mail">
				<xsl:apply-templates select="."/>,&#032;</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="org" match="*">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="AdressStr" select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<br>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</br>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<br/>
		Код страны:
		<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<br/>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<br/>
		Наименование ОПФ:
		<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<br/>
		УИТН:
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<br/>
		УИ ФЛ:
		<xsl:apply-templates select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<br/>
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:apply-templates mode="сommunication" select="."/>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="docBase" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name(.)='PrDocumentName'">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="local-name(.)='PrDocumentNumber'">
					<xsl:text> № </xsl:text>
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="local-name(.)='PrDocumentDate'">
					<xsl:text> от </xsl:text>
					<xsl:apply-templates select="." mode="russian_date2"/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="docNumDate" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name(.)='PrDocumentNumber'">
					<xsl:text>№</xsl:text>
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="local-name(.)='PrDocumentDate'">
					<xsl:text> от </xsl:text>
					<xsl:apply-templates select="." mode="russian_date2"/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="personBase">
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:apply-templates select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>&#160;</xsl:text>
			<xsl:apply-templates select="cat_ru:PersonName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="gtd_num" match="*">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>/<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="guar_cer:CustomsPersonDetails">
		<xsl:apply-templates select="." mode="personBase"/>
		<xsl:if test="string-length(guar_cer:LNP) &gt; 0 or string-length(guar_cer:LNPCustomsCode) &gt; 0">
			<xsl:text> (</xsl:text>
			<xsl:if test="guar_cer:LNP">
				<xsl:text>ЛНП: </xsl:text>
				<xsl:apply-templates select="guar_cer:LNP"/>
			</xsl:if>
			<xsl:if test="guar_cer:LNPCustomsCode">
				<xsl:if test="string-length(guar_cer:LNP) &gt; 0">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>Код таможенного органа: </xsl:text>
				<xsl:apply-templates select="guar_cer:LNPCustomsCode"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(guar_cer:LNP) &gt; 0 or string-length(guar_cer:LNPCustomsCode) &gt; 0">
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date2">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
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
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/><xsl:text/><xsl:value-of select="substring($dateIn,6,2)"/><xsl:text/><xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='GuarantCertificate']//*" priority="-1">
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
			<xsl:call-template name="russian_date2">
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
