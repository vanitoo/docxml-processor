<?xml version="1.0" encoding="utf-8"?>
<!-- Форма уведомления из письма ГУФТДиТР №05-58/55489 от 04.10.2017г. 
с версии 5.14.0: 
nrd:DocKind = 9 - Приказ ФРС России от 30.10.2018 № 1752 - Уведомление (уточнение к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cltComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonLeafTypesCust:5.8.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.24.0" xmlns:nrd="urn:customs.ru:Information:GuaranteeDocuments:NotifRequirmentDebt:5.28.0" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.24.0">
	<!-- Шаблон для типа NotifRequirmentDebtType -->
	<xsl:template match="nrd:NotifRequirmentDebt">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					page-break-after: always;
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
					border: 1px solid #000000;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					font-style: Italic;
					}

					div.title, tr.title td { font-weight:bold; }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px #000000;
					}
					

					.delim_3 {
					height: 3pt;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
				</style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="nrd:DocKind=3 or nrd:DocKind=4">
						<div class="page">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>
													<xsl:text>Требование № </xsl:text>
													<span class="value">
														<xsl:value-of select="nrd:DocDetails/cat_ru:PrDocumentNumber"/>
													</span>
													<xsl:if test="nrd:DocDetails/cat_ru:PrDocumentDate">
														<xsl:text> от </xsl:text>
														<span class="value">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="nrd:DocDetails/cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</span>
													</xsl:if>
													<br/>
													<xsl:choose>
														<xsl:when test="nrd:DocKind = 3">бенефициара </xsl:when>
														<xsl:when test="nrd:DocKind = 4">кредитора </xsl:when>
													</xsl:choose>
												об уплате денежной суммы по банковской гарантии
											</b>
											</font>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
										</td>
									</tr>
									<tr align="center">
										<td style="font-size: 8pt;">
									(наименование таможенного органа)
									</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>информирует о неисполнении должником </td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates mode="organization" select="nrd:Debtor"/>
										</td>
									</tr>
									<tr align="center">
										<td style="font-size: 8pt;">
										(полное наименование организации, Ф.И.О. индивидуального предпринимателя, ИНН/КПП, адрес принципала)
									</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>своих обязательств, обеспеченных
											<xsl:choose>
												<xsl:when test="nrd:GuaranteeDoc">
													<xsl:for-each select="nrd:GuaranteeDoc">
														<xsl:choose>
															<xsl:when test="grn_cat:DocumentKind=0"> заявлением о выдаче/приобретении акцизных марок</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=1"> ДТ/ЗВ</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=2"> ТД</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=3"> книжкой МДП</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=4"> сертификатом</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=5"> ТПО</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=6"> ТР</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=7"> дополнением к договору поручительства</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=8"> банковской гарантией</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=9"> документом включения в реестр</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=10"> пассажирской декларацией</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=11"> ходатайством о приостановлении исполнения обжалуемого решения</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=12"> УИН разрешения</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=13"> рег.номером разрешения</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=14"> разовым сертификатом</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=15"> генеральным сертификатом</xsl:when>
														</xsl:choose>
													</xsl:for-each>
												</xsl:when>
												<xsl:when test="nrd:CustomsDocument">
													<xsl:for-each select="nrd:CustomsDocument">
														<xsl:choose>
															<xsl:when test="grn_cat:DocumentKind=0"> заявлением о выдаче/приобретении акцизных марок</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=1"> ДТ/ЗВ</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=2"> ТД</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=3"> книжкой МДП</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=4"> сертификатом</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=5"> ТПО</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=6"> ТР</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=7"> дополнением к договору поручительства</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=8"> банковской гарантией</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=9"> документом включения в реестр</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=10"> пассажирской декларацией</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=11"> ходатайством о приостановлении исполнения обжалуемого решения</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=12"> УИН разрешения</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=13"> рег.номером разрешения</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=14"> разовым сертификатом</xsl:when>
															<xsl:when test="grn_cat:DocumentKind=15"> генеральным сертификатом</xsl:when>
														</xsl:choose>
													</xsl:for-each>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:choose>
												<xsl:when test="nrd:GuaranteeDoc">
													<xsl:for-each select="nrd:GuaranteeDoc">
														<!--xsl:choose>
															<xsl:when test="nrd:GuaranteeKind=2">
																<xsl:for-each select="nrd:GuaranteeInfo">
																	<xsl:text>№ </xsl:text>
																	<xsl:value-of select="nrd:GuaranteeOriginalNumber"/>
																	<xsl:text> от </xsl:text>
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="nrd:GuaranteeOriginalDate"/>
																	</xsl:call-template>
																	<xsl:text>, </xsl:text>
																</xsl:for-each>
															</xsl:when>
															<xsl:otherwise>
																<xsl:for-each select="nrd:ContractInfo">
																	<xsl:if test="nrd:ContractDate">от&#32;
																	<xsl:call-template name="russian_date">
																			<xsl:with-param name="dateIn" select="nrd:ContractDate"/>
																		</xsl:call-template>
																	</xsl:if>
																	<xsl:if test="nrd:ContractNumber"> № <xsl:value-of select="nrd:ContractNumber"/>
																	</xsl:if>
																</xsl:for-each>
																<xsl:text>, </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:if test="nrd:GuaranteeRegNumber">
														рег.номер обеспечения: <xsl:value-of select="nrd:GuaranteeRegNumber"/>
															<xsl:text>, </xsl:text>
														</xsl:if-->
														<xsl:apply-templates select="." mode="document"/>
														<xsl:if test="grn_cat:ContractNumber or grn_cat:ContractDate">
															<xsl:text>, контракт </xsl:text>
															<xsl:if test="grn_cat:ContractNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="grn_cat:ContractNumber"/>
															</xsl:if>
															<xsl:if test="grn_cat:ContractDate">
																<xsl:text> от </xsl:text>
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="grn_cat:ContractDate"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:if>
														<xsl:text>, </xsl:text>
													</xsl:for-each>
												</xsl:when>
												<xsl:when test="nrd:CustomsDocument">
													<xsl:for-each select="nrd:CustomsDocument">
														<!--xsl:choose>
															<xsl:when test="nrd:GuaranteeKind=2">
																<xsl:for-each select="nrd:GuaranteeInfo">
																	<xsl:text>№ </xsl:text>
																	<xsl:value-of select="nrd:GuaranteeOriginalNumber"/>
																	<xsl:text> от </xsl:text>
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="nrd:GuaranteeOriginalDate"/>
																	</xsl:call-template>
																	<xsl:text>, </xsl:text>
																</xsl:for-each>
															</xsl:when>
															<xsl:otherwise>
																<xsl:for-each select="nrd:ContractInfo">
																	<xsl:if test="nrd:ContractDate">от&#32;
																	<xsl:call-template name="russian_date">
																			<xsl:with-param name="dateIn" select="nrd:ContractDate"/>
																		</xsl:call-template>
																	</xsl:if>
																	<xsl:if test="nrd:ContractNumber"> № <xsl:value-of select="nrd:ContractNumber"/>
																	</xsl:if>
																</xsl:for-each>
																<xsl:text>, </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:if test="nrd:GuaranteeRegNumber">
														рег.номер обеспечения: <xsl:value-of select="nrd:GuaranteeRegNumber"/>
															<xsl:text>, </xsl:text>
														</xsl:if-->
														<xsl:apply-templates select="." mode="document"/>
														<xsl:if test="grn_cat:ContractNumber or grn_cat:ContractDate">
															<xsl:text>, контракт </xsl:text>
															<xsl:if test="grn_cat:ContractNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="grn_cat:ContractNumber"/>
															</xsl:if>
															<xsl:if test="grn_cat:ContractDate">
																<xsl:text> от </xsl:text>
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="grn_cat:ContractDate"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:if>
														<xsl:text>, </xsl:text>
													</xsl:for-each>
												</xsl:when>
											</xsl:choose>
											<xsl:apply-templates mode="organization" select="nrd:Guarantor"/>
										</td>
									</tr>
									<tr align="center">
										<td style="font-size: 8pt;">
										(реквизиты банковской гарантии/договора поручительства, организация гарант)
									</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:value-of select="nrd:ViolationInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td style="font-size: 8pt;">
										(описание, в чем состоит нарушение принципалом обязанности по уплате таможенных пошлин, налогов, пеней и процентов, в обеспечение которой выдана гарантия)
									</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="45%">В связи с неисполнением обязанностей</td>
														<td width="55%" valign="bottom" align="center" class="value">
															<xsl:value-of select="nrd:Debtor/cat_ru:OrganizationName"/>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td style="font-size: 8pt;">(наименование организации или ФИО принципала)</td>
													</tr>
													<tr>
														<td>обеспеченных банковской гарантией</td>
														<td class="value" align="center" valign="bottom">
															<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td style="font-size: 8pt;">(наименование таможенного органа)</td>
													</tr>
													<tr>
														<td class="delim_3" colspan="2">
															<br/>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<xsl:text>требует в течение десяти календарных дней с даты получения данного требования перечислить денежные средства в сумме </xsl:text>
															<span class="value">
																<xsl:value-of select="nrd:Amount"/>
																<xsl:text> (</xsl:text>
																<xsl:value-of select="nrd:AmountLetter"/>
																<xsl:text>)</xsl:text>
															</span>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%" class="graphMain">
												<tbody>
													<tr valign="top">
														<td align="left" class="bordered" width="14%" style="font-weight:bold;">Вид платежа</td>
														<td align="left" width="43%" class="bordered" style="font-weight:bold;">Код бюджетной классификации</td>
														<td align="left" width="43%" class="bordered" style="font-weight:bold;">Сумма, руб.</td>
													</tr>
													<xsl:for-each select="nrd:Paying">
														<tr>
															<td class="bordered">
																<xsl:value-of select="nrd:PaymentName"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="nrd:CBC"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="nrd:Amount"/>
																<xsl:if test="nrd:AmountLetter">
																	<xsl:text> (</xsl:text>
																	<xsl:value-of select="nrd:AmountLetter"/>
																	<xsl:text>)</xsl:text>
																</xsl:if>
																<xsl:if test="nrd:CurrencyCode">
																	<xsl:text> (</xsl:text>
																	<xsl:value-of select="nrd:CurrencyCode"/>
																	<xsl:text>)</xsl:text>
																</xsl:if>
															</td>
														</tr>
													</xsl:for-each>
													<tr>
														<td class="bordered" colspan="2" align="right">Итого: </td>
														<td class="bordered">
															<xsl:value-of select="nrd:Amount"/>
															<xsl:text> (</xsl:text>
															<xsl:value-of select="nrd:AmountLetter"/>
															<xsl:text>)</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="45%">по следующим банковским реквизитам</td>
														<td width="55%" align="center" valign="bottom" class="value">
															<xsl:value-of select="nrd:PaymentRequisitions/catComFin_ru:BankName"/>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td style="font-size: 8pt;">(банк получателя)</td>
													</tr>
													<tr>
														<td class="value" colspan="2">
															<xsl:apply-templates select="nrd:PaymentRequisitions"/>
														</td>
													</tr>
													<tr align="center">
														<td style="font-size: 8pt;" colspan="2">(БИК, счет №, получатель, ИНН, КПП, ОКАТО)</td>
													</tr>
													<tr>
														<td width="45%">В случае, если настоящее требование не будет исполнено,</td>
														<td width="55%" valign="bottom" align="center" class="value">
															<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td style="font-size: 8pt;">(наименование таможенного органа)</td>
													</tr>
													<tr>
														<td style="width:75mm">реализует право бесспорного списания с</td>
														<td valign="bottom" align="center" class="value">
															<xsl:value-of select="nrd:Guarantor/cat_ru:OrganizationName"/>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td style="font-size: 8pt;">(полное наименование организации гаранта)</td>
													</tr>
													<tr>
														<td colspan="2">
															<xsl:text>сумм, указанных в данном требовании и неустойки в размере 0,1% от суммы, подлежащей уплате за каждый каждый календарный день просточки, начиная с дня, следующего за днем, установленного в требовании срока уплаты.</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="20%">Приложение:</td>
														<td width="80%" valign="bottom" class="value">
															<xsl:value-of select="nrd:Appendix"/>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td>
															<br/>
														</td>
													</tr>
													<tr>
														<td>Начальник</td>
														<td class="value">
															<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td style="font-size: 8pt;">(наименование таможенного органа)</td>
													</tr>
													<tr>
														<td colspan="2">М.П.</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="nrd:DocKind=5 or nrd:DocKind=6 or nrd:DocKind=7">
						<div class="page">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td align="center" class="graphMain">
											<font size="4">
												<xsl:choose>
													<xsl:when test="nrd:DocKind=5">Информирование о частичном взыскании за счет обеспечения</xsl:when>
													<xsl:when test="nrd:DocKind=6">Уведомление о завершении взыскания</xsl:when>
													<xsl:when test="nrd:DocKind=7">Уведомление об отмене взыскания</xsl:when>
												</xsl:choose>
											</font>
											<br/>
											<b>
												<xsl:if test="nrd:DocDetails/cat_ru:PrDocumentDate">
													<xsl:text>от </xsl:text>
													<span class="value">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="nrd:DocDetails/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</span>
												</xsl:if>
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:value-of select="nrd:DocDetails/cat_ru:PrDocumentNumber"/>
												</span>
											</b>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="value">
											<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="nrd:CustomsOffice/cat_ru:Code"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="nrd:CustomsOffice/nrd:Address"/>
										</td>
									</tr>
									<tr align="center">
										<td style="font-size: 8pt;">
									(наименование таможенного органа, адрес таможенного органа)
									</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align:justify;">
									на основании статьи ___ Таможенного кодекса Евразийского экономического союза и статьи ___ Федерального закона от "___"______ 20__ г. № ____ "О таможенном регулировании Российской Федерации" уведомляет
									</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates mode="organization" select="nrd:Debtor"/>
										</td>
									</tr>
									<tr align="center">
										<td style="font-size: 8pt;">
									(наименование организации или индивидуального предпринимателя, ФИО физического лица, ИНН, КПП (если имеются), паспортные данные, адрес)
									</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td align="justify">
											<xsl:choose>
												<xsl:when test="nrd:DocKind=5">
												о частичном взыскании за счет обеспечения
												<xsl:if test="nrd:AmountActuallyRecovered"> в размере <span class="value">
															<xsl:value-of select="nrd:AmountActuallyRecovered"/>
														</span>
													</xsl:if>
												</xsl:when>
												<xsl:when test="nrd:DocKind=6">
												о завершении взыскания
												<xsl:if test="nrd:DateEndPenaltyPayment"> c&#32; 
													<span class="value">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="nrd:DateEndPenaltyPayment"/>
															</xsl:call-template>
														</span>
													</xsl:if>
												</xsl:when>
												<xsl:when test="nrd:DocKind=7">
												об отмене взыскания
												<span class="value">
														<xsl:if test="nrd:DateEndPenaltyPayment"> c&#32; 
													<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="nrd:DateEndPenaltyPayment"/>
															</xsl:call-template>
														</xsl:if>
													</span>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent: 5%">
											<xsl:text>В адрес декларанта/таможенного представителя </xsl:text>
											<span class="value">
												<xsl:apply-templates mode="organization" select="nrd:Declarant"/>
											</span>
											<xsl:text> направлено уведомление № </xsl:text>
											<span class="value">&#160;<xsl:value-of select="nrd:DocDetails/cat_ru:PrDocumentNumber"/>&#160;</span>.
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
											<table>
												<tr>
													<td>
														<table>
															<tr>
																<td width="20%" align="right">Исполнитель: </td>
																<td width="40%" align="center" class="value">
																	<xsl:value-of select="nrd:DocSign/nrd:PersonName"/>
																</td>
																<td width="15%" align="right">Телефон: </td>
																<td width="25%" class="value" align="center">
																	<xsl:value-of select="nrd:DocSign/nrd:Phone"/>
																</td>
															</tr>
															<tr>
																<td/>
																<td style="font-size: 8pt;" align="center">(Ф.И.О.)</td>
																<td/>
																<td/>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<br/>
														<br/>
													</td>
												</tr>
												<tr>
													<td>
										Отметка о вручении
										</td>
												</tr>
												<tr>
													<td>
														<br/>
														<table>
															<tr>
																<td width="20%" class="value" align="center">
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="nrd:ReceiveMark/nrd:DateSign"/>
																	</xsl:call-template>
																</td>
																<td width="5%"/>
																<td width="25%" style="border-bottom:1px solid black;"/>
																<td width="5%"/>
																<td width="45%" align="center" class="value">
																	<xsl:value-of select="nrd:ReceiveMark/nrd:PersonName"/>
																</td>
															</tr>
															<tr valign="top" align="center">
																<td style="font-size: 8pt;">(дата вручения)</td>
																<td/>
																<td style="font-size: 8pt;">(подпись)</td>
																<td/>
																<td style="font-size: 8pt;">(Ф.И.О. уполномоченного представителя организации или физического лица)</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="nrd:DocKind=8 or nrd:DocKind=9">
						<div class="page">
							<table class="graphMain" width="100%">
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>
												Уведомление (уточнение к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</b>
											</font>
											<br/>
											<xsl:if test="nrd:DocDetails/cat_ru:PrDocumentDate">
												<xsl:text>от </xsl:text>
												<xsl:call-template name="DateStr">
													<xsl:with-param name="date" select="nrd:DocDetails/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:text> № </xsl:text>
											<span class="value">&#160;<xsl:value-of select="nrd:DocDetails/cat_ru:PrDocumentNumber"/>&#160;</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="nrd:CustomsOffice/cat_ru:Code"/>
											<!--xsl:text> </xsl:text>
										<xsl:value-of select="nrd:CustomsOffice/nrd:Address"/-->
										</td>
									</tr>
									<tr align="center">
										<td style="font-size: 8pt;">
									(наименование таможенного органа)
									</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align:justify">
									на основании статьи 73 Федерального закона от 3 августа 2018 г. № 298-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»<sup>1</sup> уведомляет
									</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates mode="organization" select="nrd:Debtor"/>
										</td>
									</tr>
									<tr align="center">
										<td style="font-size: 8pt;">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии), адрес (место нахождения)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align:justify;">
									о неисполнении обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных в 
									</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="nrd:CalcDebtDoc" mode="document"/>
										</td>
									</tr>
									<tr align="center">
										<td style="font-size: 8pt;">
									(регистрационный номер и дата корректировки декларации на товары или расчета таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, расчета таможенных пошлин, налогов, взимаемых по единым ставкам, либо таможенных пошлин, налогов, взимаемых в виде совокупного таможенного платежа, корректировки таможенного приходного ордера, заявления, предусмотренного пунктом 4 статьи 277 Таможенного кодекса Евразийского экономического союза<sup>2</sup> , либо иного таможенного документа, определенного Евразийской экономической комиссией в соответствии с пунктом 24 статьи 266 Таможенного кодекса Евразийского экономического союза)
									</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
							в размере:<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table class="graphMain" width="100%">
												<tbody>
													<tr>
														<td width="5%"/>
														<td width="40%"/>
														<!--td width="45%"/-->
														<td width="35%"/>
														<td width="20%"/>
													</tr>
													<tr valign="middle" align="center">
														<td valign="top" class="bordered" rowspan="2">№</td>
														<td align="center" class="bordered" colspan="2">Подлежащие уплате таможенные платежи, специальные, антидемпинговые, компенсационные пошлины, проценты и пени</td>
														<td valign="top" align="center" class="bordered" rowspan="2">Срок исполнения обязанности</td>
													</tr>
													<tr valign="top" align="center">
														<td align="center" class="bordered">код вида платежа<sup>3</sup></td>
														<!--td align="center" class="bordered">код бюджетной классификации</td-->
														<td class="bordered">cумма, рубли</td>
													</tr>
													<xsl:for-each select="nrd:Paying">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="position()"/>
															</td>
															<td class="bordered" align="center">
																<xsl:value-of select="nrd:PaymentModeCode"/>
															</td>
															<!--td class="bordered" align="left">
																<xsl:value-of select="nrd:CBC"/>
															</td-->
															<td class="bordered" align="right">
																<xsl:value-of select="translate(nrd:Amount,'.',',')"/>
																<xsl:if test="nrd:CurrencyCode">
																	<xsl:text> (</xsl:text>
																	<xsl:value-of select="nrd:CurrencyCode"/>
																	<xsl:text>)</xsl:text>
																</xsl:if>
															</td>
															<td class="bordered" align="center">
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="nrd:DatePayment"/>
																</xsl:call-template>
															</td>
														</tr>
													</xsl:for-each>
													<tr>
														<td class="bordered"/>
														<td class="bordered" align="left">Итого: </td>
														<td class="bordered" align="right">
															<xsl:value-of select="translate(nrd:Amount,'.',',')"/>
														</td>
														<td class="bordered"/>
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
										<td style="text-align:justify; text-indent: 5%">
											<xsl:text>Обязанность   по  уплате  таможенных  платежей,  специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, указанная в настоящем уведомлении (уточнении к уведомлению), подлежит исполнению в соответствии со статьей 30 Федерального закона от 3 августа 2018 г. N 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесенииизменений в отдельные законодательные акты Российской Федерации". При
уплате в безналичной форме денежные средства вносятся на счет Федерального казначейства</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:value-of select="nrd:PaymentRequisitions/catComFin_ru:BankName"/>
											<xsl:if test="count(nrd:PaymentRequisitions/*) &gt; 1">, </xsl:if>
											<xsl:apply-templates select="nrd:PaymentRequisitions"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align:justify; text-indent: 5%">
											<xsl:text>При неисполнении уведомления (уточнения к уведомлению) в течение </xsl:text>
											<xsl:apply-templates select="nrd:ExecNotification[nrd:DocType = 0]/nrd:ExecDays"/>
											<xsl:text> рабочих дней со дня получения настоящего уведомления и (или) в истечение </xsl:text>
											<xsl:apply-templates select="nrd:ExecNotification[nrd:DocType = 1]/nrd:ExecDays"/>
											<xsl:text> рабочих дней со дня получения уточнения к уведомлению, но не ранее истечения срока исполнения уведомления, к которому направлено уточнение, таможенный орган примет меры взыскания таможенных платежей, специальных , антидемпинговых, компенсационных пошлин, процентов и пеней в соответствии с главой 12 Федерального закона от 3 августа 2018 г. N 289-ФЗ.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="bordered" style="text-align: justify">
											<!--br/>
											<xsl:text>(данный раздел заполняется в случае направления уточнения к уведомлению о не уплаченных в установленный срок суммах таможенных платежей, специальный, антидемпинговых, компенсационных пошлин, процентов и пеней)</xsl:text>
											<br/-->
											<br/>В связи с изменением размера исчисленных и подлежащих уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней уведомление (уточнение к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней от 
													&#160;
													<xsl:choose>
												<xsl:when test="nrd:DocKind=9">
													<xsl:call-template name="DateStr">
														<xsl:with-param name="date" select="nrd:WithdrawnNotice/cat_ru:PrDocumentDate"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
												</xsl:otherwise>
											</xsl:choose>
													&#160; № <span class="value">&#160;
													<xsl:choose>
													<xsl:when test="nrd:DocKind=9">
														<xsl:value-of select="nrd:WithdrawnNotice/cat_ru:PrDocumentNumber"/>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
													&#160;</span> считать отозванным (при направлении уточнения к уведомлению о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней).
													<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table class="graphMain" width="100%">
												<tbody>
													<xsl:for-each select="nrd:JointrespNotification">
														<tr>
															<td>
																<table>
																	<tbody>
																		<tr>
																			<td width="15%">
																				<xsl:text>В адрес </xsl:text>
																			</td>
																			<td align="center" valign="bottom" class="value" width="85%">
																				<xsl:choose>
																					<xsl:when test="nrd:JointKind=0">
																						<xsl:text>плательщик (декларант)</xsl:text>
																					</xsl:when>
																					<xsl:when test="nrd:JointKind=1">
																						<xsl:text>таможенный представитель</xsl:text>
																					</xsl:when>
																					<xsl:when test="nrd:JointKind=2">
																						<xsl:text>таможенный перевозчик</xsl:text>
																					</xsl:when>
																					<xsl:when test="nrd:JointKind=3">
																						<xsl:text>иной тип обязанности</xsl:text>
																					</xsl:when>
																				</xsl:choose>
																			</td>
																		</tr>
																		<tr>
																			<td/>
																			<td align="center" style="font-size: 8pt;">
																				<xsl:text>(плательщик и (или) лицо, несущее солидарную ответственность)</xsl:text>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</td>
														</tr>
														<tr>
															<td class="value">
																<xsl:apply-templates mode="organization" select="nrd:JointRespPers"/>
															</td>
														</tr>
														<tr align="center">
															<td style="font-size: 8pt;">(полное фирменное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица, идентификационный номер налогоплательщика (при наличии)	</td>
														</tr>
														<tr>
															<td class="delim_3"/>
														</tr>
														<tr>
															<td style="text-align: justify">
																<xsl:text>направлено уведомление (уточнение к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней от </xsl:text>
																<span class="value">&#160;&#160;<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="nrd:NotificationReqs/cat_ru:PrDocumentDate"/>
																	</xsl:call-template>&#160;&#160;</span>
																<xsl:text> № </xsl:text>
																<span class="value">&#160;&#160;<xsl:value-of select="nrd:NotificationReqs/cat_ru:PrDocumentNumber"/>&#160;&#160;</span>.
																<br/>
																<br/>
									</td>
														</tr>
														<tr>
															<td>
																<br/>
																<br/>
															</td>
														</tr>
													</xsl:for-each>
													<!--tr>
														<td width="100%" class="graphMain">
															<table>
																<tbody>
																	<tr>
																		<td width="20%" align="right">Исполнитель: </td>
																		<td width="40%" align="center" class="value">
																			<xsl:value-of select="nrd:DocSign/nrd:PersonName"/>
																		</td>
																		<td width="15%" align="right">Телефон: </td>
																		<td width="25%" class="value" align="center">
																			<xsl:value-of select="nrd:DocSign/nrd:Phone"/>
																		</td>
																	</tr>
																	<tr>
																		<td/>
																		<td style="font-size: 8pt;" align="center">(инициалы, фамилия должностного лица таможенного органа)</td>
																		<td/>
																		<td/>
																	</tr>
																</tbody>
															</table>
														</td>
													</tr-->
													<!--tr>
														<td>
															<br/>
															<br/>
														</td>
													</tr-->
													<tr>
														<td>
										Получено непосредственно под расписку при вручении уведомления (уточнения к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней лицу, которому оно адресовано, или его представителю
															<br/>
															<br/>
														</td>
													</tr>
													<tr>
														<td>
															<table>
																<tr>
																	<td class="value" width="15%"/>
																	<td width="5%"/>
																	<td width="40%" align="center" class="value">
																		<xsl:value-of select="nrd:ReceiveMark/nrd:PersonName"/>
																	</td>
																	<td width="5%"/>
																	<td width="35%" align="center">
																		<xsl:call-template name="DateStr">
																			<xsl:with-param name="date" select="nrd:ReceiveMark/nrd:DateSign"/>
																		</xsl:call-template>
																	</td>
																</tr>
																<tr valign="top" align="center">
																	<td style="font-size: 8pt;">(подпись)</td>
																	<td/>
																	<td style="font-size: 8pt;">(фамилия, имя, отчество (при наличии) руководителя организации (индивидуального предпринимателя), уполномоченного представителя организации (индивидуального предпринимателя), физического лица, не являющегося индивидуальным предпринимателем)</td>
																	<td/>
																	<td style="font-size: 8pt;">(дата вручения)</td>
																</tr>
															</table>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table style="font-size: 8pt;" width="100%">
												<tbody>
													<tr>
														<td width="40%" style="border-bottom:1px solid black;"/>
														<td width="60%"/>
													</tr>
													<tr>
														<td style="text-align:justify; text-align: 5%" colspan="2">
															<sup>1</sup>Далее - Федеральный закон от 3 августа 2018 г. № 289-ФЗ.</td>
													</tr>
													<tr>
														<td colspan="2" style="text-align:justify; text-align: 5%">
															<sup>2</sup>Является обязательным для Российской Федерации в соответствии с Договором о Таможенном кодексе Евразийского экономического союза от 11 апреля 2017г., ратифицированным Федеральным законом от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможнном кодексе Евразийского экономического союза". Вступил в силу для Российской Федерации 1 января 2018 года.</td>
													</tr>
													<tr>
														<td style="text-align:justify; text-align: 5%" colspan="2">
															<sup>3</sup>Приложение №9 к Решению Комиссии Тмаоженного союза от 20 сентября 2010 г. № 378 "О классификаторах, используемых для заполнения таможенных документов". Является обязательным для Российской Федерации в соответствии с Договором об учреждении Евразийского экономического сообщества от 10 октября 2000г., ратифицированным Федеральным законом от 22 мая 2001 г. № 56-ФЗ "О ратификации Договора об учреждении Евразийского экономического сообщества" (Договор вступил в силу для Российской Федерации 30 мая 2001г.), Договором о Евразийском экономическом союзе от 29 мая 2014 г., ратифицированным Федеральным законом от 3 октября 2014 г. № 279-ФЗ "О ратификации Договора о Европейском экономическом союзе" (Договор вступил в силу для Российской Федерации 1 января 2015 г.). Вступило в силу для Российской Федерации 1 января 2011г.</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="page">
							<table class="w180">
								<tr>
									<td align="center" class="graphMain">
										<font size="4">Уведомление </font>
										<br/>
										<xsl:if test="nrd:DocDetails/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="nrd:DocDetails/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:text> № </xsl:text>
										<xsl:value-of select="nrd:DocDetails/cat_ru:PrDocumentNumber"/>
									</td>
								</tr>
							</table>
							<br/>
							<table class="w180">
								<tr valign="top" align="center">
									<td style="border-bottom: 1px solid black;">
										<xsl:value-of select="nrd:CustomsOffice/cat_ru:OfficeName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="nrd:CustomsOffice/cat_ru:Code"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="nrd:CustomsOffice/nrd:Address"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
									(наименование таможенного органа, адрес таможенного органа)
									</td>
								</tr>
								<tr>
									<td align="justify">
									на основании статьи ___ Таможенного кодекса Евразийского экономического союза и статьи ___ Федерального закона от "___"______ 20__ г. № ____ "О таможенном регулировании Российской Федерации" уведомляет
									</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid black;">
										<xsl:apply-templates mode="organization" select="nrd:Debtor"/>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size: 8pt;">
									(наименование организации или индивидуального предпринимателя, ФИО физического лица, ИНН, КПП (если имеются), паспортные данные, адрес)
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td align="justify">
										<br/>&#160;&#160;&#160;&#160;&#160;
										<xsl:text>В адрес декларанта/таможенного представителя </xsl:text>
										<u>
											<xsl:apply-templates mode="organization" select="nrd:Declarant"/>
										</u>
										<xsl:text> направлено уведомление № </xsl:text>
										<u>&#160;<xsl:value-of select="nrd:DocDetails/cat_ru:PrDocumentNumber"/>&#160;</u>.
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<br/>
										<table>
											<tr>
												<td align="right">Исполнитель: </td>
												<td width="50%" style="border-bottom:1px solid black;">
													<xsl:value-of select="nrd:DocSign/nrd:PersonName"/>
												</td>
												<td align="right">Телефон: </td>
												<td width="20%" style="border-bottom:1px solid black;">
													<xsl:value-of select="nrd:DocSign/nrd:Phone"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center">(Ф.И.О.)</td>
												<td/>
												<td/>
											</tr>
										</table>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="border-top:1px dashed;">
										Отметка о вручении
										<br/>
										<br/>
										<table>
											<tr>
												<td width="20%" style="border-bottom:1px solid black;" align="center">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="nrd:ReceiveMark/nrd:DateSign"/>
													</xsl:call-template>
												</td>
												<td width="2.5%"/>
												<td width="25%" style="border-bottom:1px solid black;"/>
												<td width="2.5%"/>
												<td width="50%" style="border-bottom:1px solid black;">
													<xsl:value-of select="nrd:ReceiveMark/nrd:PersonName"/>
												</td>
											</tr>
											<tr valign="top" align="center">
												<td style="font-size: 8pt;">(дата вручения)</td>
												<td/>
												<td style="font-size: 8pt;">(подпись)</td>
												<td/>
												<td style="font-size: 8pt;">(Ф.И.О. уполномоченного представителя организации или физического лица)</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="nrd:PaymentRequisitions">
		<!--xsl:value-of select="catComFin_ru:BankName"/-->
		<xsl:if test="nrd:RecipientName"/>
		<xsl:if test="catComFin_ru:OKPOID">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="catComFin_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:BICID">
			<xsl:text>, БИК: </xsl:text>
			<xsl:value-of select="catComFin_ru:BICID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:SWIFTID">
			<xsl:text>, SWIFT: </xsl:text>
			<xsl:value-of select="catComFin_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:AccountNumeric">
			<xsl:text>, корр.счет: </xsl:text>
			<xsl:value-of select="catComFin_ru:AccountNumeric"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:CurrentCurrencyAccount">
			<xsl:text>, валютный счет (текущий): </xsl:text>
			<xsl:for-each select="catComFin_ru:CurrentCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:TransitCurrencyAccount">
			<xsl:text>, валютный счет (транзитный): </xsl:text>
			<xsl:for-each select="catComFin_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:SpecialTransitCurrencyAccount">
			<xsl:text>, валютный счет (специальный): </xsl:text>
			<xsl:for-each select="catComFin_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:RoubleCurrencyAccount">
			<xsl:text>, рублевый счет: </xsl:text>
			<xsl:value-of select="catComFin_ru:RoubleCurrencyAccount"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:BankPostalAddress">
			<xsl:text>, адрес: </xsl:text>
			<xsl:for-each select="catComFin_ru:BankPostalAddress/*">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="nrd:RecipientName">
			<xsl:text>, получатель – </xsl:text>
			<xsl:value-of select="nrd:RecipientName"/>
		</xsl:if>
		<xsl:if test="nrd:RecipientINN">
			<xsl:text>, ИНН </xsl:text>
			<xsl:value-of select="nrd:RecipientINN"/>
		</xsl:if>
		<xsl:if test="nrd:RecipientKPP">
			<xsl:text>, КПП </xsl:text>
			<xsl:value-of select="nrd:RecipientKPP"/>
		</xsl:if>
		<xsl:if test="nrd:ExtPaymentInfo">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="nrd:ExtPaymentInfo"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="document">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails"> адрес: </xsl:if>
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">; </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:PostalCode|RUScat_ru:CountryCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:value-of select="RUScat_ru:IdentityCardName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
		<xsl:text> </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:OrganizationName"/>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
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
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		&#171;<span class="value">&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</span>&#187;
		&#160;&#160;<span class="value">&#160;
		<xsl:choose>
				<xsl:when test="$month=1">января</xsl:when>
				<xsl:when test="$month=2">февраля</xsl:when>
				<xsl:when test="$month=3">марта</xsl:when>
				<xsl:when test="$month=4">апреля</xsl:when>
				<xsl:when test="$month=5">мая</xsl:when>
				<xsl:when test="$month=6">июня</xsl:when>
				<xsl:when test="$month=7">июля</xsl:when>
				<xsl:when test="$month=8">августа</xsl:when>
				<xsl:when test="$month=9">сентября</xsl:when>
				<xsl:when test="$month=10">октября</xsl:when>
				<xsl:when test="$month=11">ноября</xsl:when>
				<xsl:when test="$month=12">декабря</xsl:when>
			</xsl:choose> 					
		</span>
		<xsl:choose>
			<xsl:when test="substring($date,1,2)">
				<xsl:value-of select="substring($date,1,2)"/>
			</xsl:when>
			<xsl:otherwise>&#160;&#160;20</xsl:otherwise>
		</xsl:choose>
		<span class="value">
			<xsl:value-of select="substring($date,3,2)"/>&#160;</span>&#160;г.&#160;
	</xsl:template>
	<xsl:template name="DateGrid">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">&#171;</td>
					<td width="13%" class="border_bottom">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left">&#187;</td>
					<td width="3%"> </td>
					<td width="58%" class="border_bottom">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
						<xsl:choose>
							<xsl:when test="$month=1">января</xsl:when>
							<xsl:when test="$month=2">февраля</xsl:when>
							<xsl:when test="$month=3">марта</xsl:when>
							<xsl:when test="$month=4">апреля</xsl:when>
							<xsl:when test="$month=5">мая</xsl:when>
							<xsl:when test="$month=6">июня</xsl:when>
							<xsl:when test="$month=7">июля</xsl:when>
							<xsl:when test="$month=8">августа</xsl:when>
							<xsl:when test="$month=9">сентября</xsl:when>
							<xsl:when test="$month=10">октября</xsl:when>
							<xsl:when test="$month=11">ноября</xsl:when>
							<xsl:when test="$month=12">декабря</xsl:when>
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">20</td>
					<td width="9%" class="border_bottom" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
