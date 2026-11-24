<?xml version="1.0" encoding="utf-8"?>
<!-- Проект Приказа ФТС России (от 25.02.2019 N 321) "Об утверждении форм заявления лица, внесшего авансовые платежи, о предоставлении отчета о расходовании денежных средств, внесенных в качестве авансовых платежей, отчета о расходовании денежных средств, внесенных в качестве авансовых платежей, порядка подачи лицом, внесшим авансовые платежи, заявления о предоставлении отчета о расходовании денежных средств, внесенных в качестве авансовых платежей, а также порядка предоставления таможенным органом Российской Федерации такого отчета" Приложение №2 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:els_agr="urn:customs.ru:Information:ELSDocuments:ELSAggregateTypes:5.27.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:trinf="urn:customs.ru:Information:ELSDocuments:ELSTransactionInfo:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:template match="trinf:ELSTransactionInfo">
		<html>
			<head>
				<title>
					<xsl:text>Отчет о расходовании денежных средств, внесенных в качестве авансовых платежей</xsl:text>
				</title>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div
					{
					white-space: nowrap;
					}

					div.page{
					  width: 190mm;
					  margin: 5px auto;
					  margin-top: 6pt;
					  margin-bottom: 6pt;
					  padding: 15mm;
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
					border: 1px solid black;
					}

					.graphMain {
					font-family: Arial;
					font-size: 11pt;
					}

					.value
					{
					font-family: Arial;
					font-size: 11pt;
					font-style: Italic;
					border-bottom: 1px solid black;
					}

					div.title, tr.title td { font-weight:bold;  }
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

					.graphHeader
					{
					font-family: Arial;
					font-size: 11pt;
					font-weight:bold;
					}

					.graphLittle {
					font-family: Arial;
					font-size: 7pt;
					}

					.underwrite{
					font-family: Arial;
					font-size: 7pt;
					}

					td.nobordered {
						border-bottom: 0px;
						border-top: 0px;
						border-left: 0px;
						border-right: 0px;
					}

					.delim {
						height: 7pt;
					}

					.underlined {
					border-bottom: 1px solid black;
					}

					.delim_3 {
						height: 3pt;
					}

        </style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td align="center">
									<font size="4">
										<b>
											<xsl:text>Отчет</xsl:text>
											<br/>
											<xsl:text>о расходовании денежных средств, внесенных в качестве</xsl:text>
											<br/>
											<xsl:text>авансовых платежей</xsl:text>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td class="value" align="center" width="47%">
													<xsl:choose>
														<xsl:when test="trinf:CustomsDetails">
															<xsl:if test="trinf:CustomsDetails/cat_ru:OfficeName">
																<xsl:value-of select="trinf:CustomsDetails/cat_ru:OfficeName"/>
																<xsl:text> (</xsl:text>
															</xsl:if>
															<xsl:value-of select="trinf:CustomsDetails/cat_ru:Code"/>
															<xsl:if test="trinf:CustomsDetails/cat_ru:OfficeName">
																<xsl:text>)</xsl:text>
															</xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>ФТС России</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td width="20%"/>
												<td class="value" align="center" width="33%">
													<xsl:apply-templates mode="russian_date" select="trinf:ReportDate"/>
												</td>
											</tr>
											<tr>
												<td align="center" class="graphLittle">
													<xsl:text>(наименование таможенного органа Российской Федерации)     </xsl:text>
												</td>
												<td/>
												<td align="center" class="graphLittle">
													<xsl:text>(дата формирования отчета)     </xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Сведения о лице, подавшем заявление о предоставлении отчета о расходовании денежных средств, внесенных в качестве авансовых платежей:</xsl:text>
								</td>
							</tr>
							<tr>
								<td align="center" class="value">
									<xsl:apply-templates select="trinf:ApplicantInfo" mode="OrganizationName"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									<xsl:text>(наименование юридического лица, фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="value">
									<xsl:choose>
										<xsl:when test="trinf:ApplicantInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:INN">
											<xsl:text>ИНН - </xsl:text>
											<xsl:value-of select="trinf:ApplicantInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/>
										</xsl:when>
										<xsl:when test="trinf:ApplicantInfo/trinf:TaxNumber">
											<xsl:if test="trinf:ApplicantInfo/trinf:TaxNumber/RUScat_ru:CountryCode">
												<xsl:value-of select="trinf:ApplicantInfo/trinf:TaxNumber/RUScat_ru:CountryCode"/>
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:text>рег. номер - </xsl:text>
											<xsl:value-of select="trinf:ApplicantInfo/trinf:TaxNumber/RUScat_ru:UITNCode"/>
										</xsl:when>
										<xsl:when test="trinf:ApplicantInfo/trinf:IdentityCard">
											<xsl:value-of select="trinf:ApplicantInfo/trinf:IdentityCard/RUScat_ru:IdentityCardName"/>
											<xsl:if test="not(trinf:ApplicantInfo/trinf:IdentityCard/RUScat_ru:IdentityCardName)">
												<xsl:value-of select="trinf:ApplicantInfo/trinf:IdentityCard/RUScat_ru:FullIdentityCardName"/>
											</xsl:if>
											<xsl:if test="trinf:ApplicantInfo/trinf:IdentityCard/RUScat_ru:IdentityCardSeries">
												<xsl:text> серия - </xsl:text>
												<xsl:value-of select="trinf:ApplicantInfo/trinf:IdentityCard/RUScat_ru:IdentityCardSeries"/>
											</xsl:if>
											<xsl:if test="trinf:ApplicantInfo/trinf:IdentityCard/RUScat_ru:IdentityCardNumber">
												<xsl:text> номер - </xsl:text>
												<xsl:value-of select="trinf:ApplicantInfo/trinf:IdentityCard/RUScat_ru:IdentityCardNumber"/>
											</xsl:if>
											<xsl:if test="trinf:ApplicantInfo/trinf:IdentityCard/RUScat_ru:CountryCode">
												<xsl:text> страна выдачи - </xsl:text>
												<xsl:value-of select="trinf:ApplicantInfo/trinf:IdentityCard/RUScat_ru:CountryCode"/>
											</xsl:if>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									<xsl:text>(в отношении лиц, состоящих на учете в налоговых органах Российской Федерации, - идентификационнный номер налогоплательщика; в отношении юридических лиц и индивидуальных предпринимателей, не состоящих на учете в налоговых органах Российской Федерации, - наименование страны и регистрационный номер (код налогоплательщика (налоговый номер) или его аналог) в стране регистрации; в отношении физических лиц, не состоящих на учете в налоговых органах Российской Федерации, - наименование, серия, номер, страна выдачи документа, удостоверяющего личность)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<!--tr>
												<td align="right" width="15%">
													<xsl:text>ИНН *</xsl:text>
												</td>
												<td align="center" class="value" width="30%">
													<xsl:value-of select="trinf:INN"/>
												</td>
												<td align="right" width="15%">
													<xsl:text>СНИЛС **</xsl:text>
												</td>
												<td align="center" class="value" width="30%"/>
											</tr>
											<tr>
												<td class="delim_3" colspan="4"/>
											</tr-->
											<tr>
												<td align="left" valign="bottom" width="8%">
													<xsl:text>на № </xsl:text>
												</td>
												<td align="center" valign="bottom" class="value" width="57%">
													<xsl:value-of select="trinf:ELSConfInfoApp/cat_ru:PrDocumentNumber"/>
												</td>
												<td align="center" valign="bottom" width="5%">
													<xsl:text> от </xsl:text>
												</td>
												<td align="center" valign="bottom" class="value" width="30%">
													<xsl:apply-templates mode="russian_date" select="trinf:ELSConfInfoApp/cat_ru:PrDocumentDate"/>
												</td>
											</tr>
											<tr>
												<td colspan="4" align="center" class="graphLittle">
													<xsl:text>(дата, номер заявления юридического лица, индивидуального предпринимателя или физического лица)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text>Остаток денежных средств на начало периода составляет:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td align="center">
									<span class="value">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="format-number(floor(trinf:BalanceIn), '# ###', 'rubliki')"/>
										<xsl:text>&#160;</xsl:text>
									</span>
									<xsl:text> руб.</xsl:text>
									<span class="value">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="substring-after(format-number(trinf:BalanceIn, '# ###,00', 'rubliki'), ',')"/>
										<xsl:text>&#160;</xsl:text>
									</span>
									<xsl:text> коп.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text>За период с </xsl:text>
									<span class="value">
										<xsl:text>&#160;</xsl:text>
										<xsl:apply-templates select="trinf:PeriodBegin" mode="russian_date"/>
										<xsl:text>&#160;</xsl:text>
									</span>
									<xsl:text> по </xsl:text>
									<span class="value">
										<xsl:text>&#160;</xsl:text>
										<xsl:apply-templates select="trinf:PeriodEnd" mode="russian_date"/>
										<xsl:text>&#160;</xsl:text>
									</span>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td width="4%"/>
												<td width="5%"/>
												<td width="17%"/>
												<td width="17%"/>
												<td width="13%"/>
												<td width="15%"/>
												<td width="14%"/>
												<td width="15%"/>
											</tr>
											<tr style="font-size: 10pt;">
												<td align="center" class="bordered" rowspan="2">
													<xsl:text>№ п/п</xsl:text>
												</td>
												<td colspan="4" align="center" class="bordered">
													<xsl:text>Сумма операции с денежными средствами</xsl:text>
												</td>
												<td colspan="3" align="center" class="bordered">
													<xsl:text>Реквизиты документа, в соответствии с которым денежные средства поступали и расходовались</xsl:text>
												</td>
											</tr>
											<tr style="font-size: 10pt;">
												<td align="center" class="bordered">
													<xsl:text>Дата операции с денежными средствами</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>поступило/</xsl:text>
													<br>зачтено</br>
												</td>
												<td align="center" class="bordered">
													<xsl:text>списано/</xsl:text>
													<br>возвращено</br>
												</td>
												<td align="center" class="bordered">
													<xsl:text>кодовое обозначение документа</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>наименование документа</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>дата документа</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>номер документа</xsl:text>
												</td>
											</tr>
											<!--tr style="font-size: 10pt;">
												<td align="center" class="bordered">
													<xsl:text>1</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>2</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>3</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>4</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>5</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>6</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>7</xsl:text>
												</td>
												<td align="center" class="bordered">
													<xsl:text>8</xsl:text>
												</td>
											</tr-->
											<xsl:for-each select="trinf:PaymentInformation">
												<xsl:sort case-order="lower-first" data-type="number" order="ascending" select="trinf:OperationNumber"/>
												<tr style="font-size: 10pt;" align="center">
													<td class="bordered">
														<xsl:value-of select="trinf:OperationNumber"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates mode="russian_date" select="trinf:OperationDate"/>
													</td>
													<td class="bordered">
														<xsl:if test="trinf:OperationType='1' or trinf:OperationType='true'">
															<xsl:value-of select="format-number(trinf:DocumentAmount/els_agr:Amount, '# ##0,00', 'rubliki')"/>
														</xsl:if>
													</td>
													<td class="bordered">
														<xsl:if test="trinf:OperationType='0' or trinf:OperationType='false'">
															<xsl:value-of select="format-number(trinf:DocumentAmount/els_agr:Amount, '# ##0,00', 'rubliki')"/>
														</xsl:if>
													</td>
													<td class="bordered">
														<xsl:value-of select="trinf:DocumentAmount/els_agr:BCC"/>
													</td>
													<td class="bordered">
														<xsl:value-of select="trinf:DocumentReq/cat_ru:PrDocumentName"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates mode="russian_date" select="trinf:DocumentReq/cat_ru:PrDocumentDate"/>
													</td>
													<td class="bordered">
														<xsl:value-of select="trinf:DocumentReq/cat_ru:PrDocumentNumber"/>
													</td>
												</tr>
											</xsl:for-each>
											<tr style="font-size: 10pt;" align="center">
												<td colspan="2" class="bordered">Итого:</td>
												<td class="bordered">
													<xsl:value-of select="format-number(trinf:TotalPayAmountReceipt, '# ##0,00', 'rubliki')"/>
												</td>
												<td class="bordered">
													<xsl:value-of select="format-number(trinf:TotalPayAmountChargeOff, '# ##0,00', 'rubliki')"/>
												</td>
												<td class="bordered" colspan="4">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text>Остаток денежных средств на конец периода составляет:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td align="center">
									<span class="value">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="format-number(floor(trinf:BalanceOut), '# ###', 'rubliki')"/>
										<xsl:text>&#160;</xsl:text>
									</span>
									<xsl:text> руб.</xsl:text>
									<span class="value">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="substring-after(format-number(trinf:BalanceOut, '# ###,00', 'rubliki'), ',')"/>
										<xsl:text>&#160;</xsl:text>
									</span>
									<xsl:text> коп.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:if test="trinf:ReportType = '1' or trinf:ReportType = 'true'">
										<br/>
										<table width="100%">
											<table>
												<tr>
													<td align="left" class="graphMain" width="25%">Уполномоченное должностное лицо таможенного органа</td>
													<td width="3%"/>
													<td width="15%" valign="bottom" align="center" class="value">
														<xsl:apply-templates mode="russian_date" select="trinf:CustomSignature/cat_ru:IssueDate"/>
													</td>
													<td width="3%"/>
													<td width="15%" class="value"/>
													<td width="3%"/>
													<td width="36%" valign="bottom" align="center" class="value">
														<xsl:if test="trinf:CustomSignature/cat_ru:PersonPost">
															<xsl:value-of select="trinf:CustomSignature/cat_ru:PersonPost"/>,
														</xsl:if>
														<xsl:if test="trinf:CustomSignature/cat_ru:PersonSurname">
															<xsl:value-of select="trinf:CustomSignature/cat_ru:PersonSurname"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="trinf:CustomSignature/cat_ru:PersonName">
															<xsl:value-of select="trinf:CustomSignature/cat_ru:PersonName"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="trinf:CustomSignature/cat_ru:PersonMiddleName">
															<xsl:value-of select="trinf:CustomSignature/cat_ru:PersonMiddleName"/>
															<xsl:text> </xsl:text>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td/>
													<td/>
													<td valign="top" align="center" class="graphLittle">(дата)</td>
													<td/>
													<td valign="top" align="center" class="graphLittle">(подпись)</td>
													<td/>
													<td align="center" class="graphLittle">(должность, фамилия, имя, отчество (при наличии)</td>
												</tr>
											</table>
										</table>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="OrganizationName" match="*">
		<xsl:if test="RUScat_ru:OrganizationName">
			<xsl:value-of select="RUScat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:ShortName">
			<xsl:if test="string-length(RUScat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="RUScat_ru:ShortName"/>
			<xsl:if test="string-length(RUScat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:decimal-format name="rubliki" decimal-separator="," grouping-separator=" "/>
	<xsl:template mode="sumWords" match="*">
		<xsl:variable name="splittedSum">
			<xsl:value-of select="translate(.,'.',',')"/>
		</xsl:variable>
		<xsl:variable name="integerPart">
			<xsl:choose>
				<xsl:when test="substring-before($splittedSum,',')!=''">
					<xsl:value-of select="substring-before($splittedSum,',')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$splittedSum"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="fractionalPart" select="substring-after($splittedSum,',')"/>
		<xsl:text> руб. </xsl:text>
		<xsl:if test="$fractionalPart!=''">
			<xsl:value-of select="substring(concat($fractionalPart,'00'),1,2)"/>
			<xsl:text> коп.</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="russian_date" match="*">
		<xsl:param name="dateIn" select="."/>
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
</xsl:stylesheet>
