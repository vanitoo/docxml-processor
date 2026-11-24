<?xml version="1.0" encoding="utf-8"?>
<!--Письмо ФТС от 31.03.2020 № 14-123/18557
AnswerCode = 1 – Заявление правообладателя об отмене решения о приостановлении срока выпуска товаров, содержащих объекты интеллектуальной собственности
AnswerCode = 3 – Запрос о продлении срока приостановления срока выпуска -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:aoir="urn:customs.ru:Information:AnswerOwnerIntellectRights:5.24.0">
	<!-- Шаблон для типа AnswerOwnerIntellectRightsType -->
	<xsl:template match="//*[local-name()='AnswerOwnerIntellectRights']//*" priority="-1">
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
	<xsl:template match="aoir:AnswerOwnerIntellectRights">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page_auto {
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					div.page {
					width: 180mm;
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
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					font-style: italic;
					vertical-align: bottom;
					}

					.descr{
						font-size: 7pt;
						text-align: center;
						vertical-align: top;
					}

					.delim_3 {
					height: 3pt;
					}

					.underlined {
					border-bottom: 1px solid windowtext;
					vertical-align:bottom;
					}

					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					font-size: 10pt;
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
					<xsl:when test="aoir:Answer/aoir:AnswerCode = '1' or aoir:Answer/aoir:AnswerCode = '3' ">
						<div class="page">
							<table width="100%">
								<tbody>
									<tr>
										<td>
											<xsl:choose>
												<xsl:when test="aoir:Answer/aoir:AnswerCode = '1'">
													<tr>
														<td align="center" style="font-weight:bold;">
															<br>
																<xsl:text>Заявление								</xsl:text>
															</br>
															<br>
																<xsl:text>правообладателя об отмене решения о приостановлении срока выпуска товаров, содержащих объекты интеллектуальной собственности</xsl:text>
															</br>
														</td>
													</tr>
												</xsl:when>
												<xsl:when test="aoir:Answer/aoir:AnswerCode = '3'">
													<tr>
														<td align="center" style="font-weight:bold;">
															<br>
																<xsl:text>Запрос							</xsl:text>
															</br>
															<br>
																<xsl:text>о продлении срока приостановления срока выпуска</xsl:text>
															</br>
														</td>
													</tr>
												</xsl:when>
											</xsl:choose>
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
														<td align="right" width="5%">
															<xsl:text>от </xsl:text>
														</td>
														<td align="center" width="20%" class="value">
															<xsl:apply-templates select="aoir:Answer/aoir:AnswerNumber/cat_ru:PrDocumentDate" mode="date_2"/>
														</td>
														<td align="right" width="45%">
															<xsl:text>№ </xsl:text>
														</td>
														<td align="center" class="value" width="30%">
															<xsl:apply-templates select="aoir:Answer/aoir:AnswerNumber/cat_ru:PrDocumentNumber"/>
														</td>
													</tr>
													<tr>
														<td/>
														<td/>
														<td/>
														<td align="center" class="descr">
															<xsl:text>(проставляется таможенным органом)</xsl:text>
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
										<td class="value">
											<xsl:apply-templates mode="organization" select="aoir:IPOOwner"/>
										</td>
									</tr>
									<tr>
										<td class="descr">
											<xsl:text>(наименование правообладателя (представителя правообладателя))</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="font-weight:bold;" align="center">
											<xsl:text>на уведомление</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates mode="CustomsOffice" select="aoir:Answer/aoir:Customs"/>
										</td>
									</tr>
									<tr>
										<td class="descr">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center">
											<xsl:text>о приостановлении срока выпуска товара</xsl:text>
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
														<td align="right" width="5%">
															<xsl:text>от </xsl:text>
														</td>
														<td align="center" width="20%" class="value">
															<xsl:apply-templates select="aoir:Answer/aoir:DecisionNumber/cat_ru:PrDocumentDate" mode="date_2"/>
														</td>
														<td align="right" width="45%">
															<xsl:text>№ </xsl:text>
														</td>
														<td align="center" class="value" width="30%">
															<xsl:apply-templates select="aoir:Answer/aoir:DecisionNumber/cat_ru:PrDocumentNumber"/>
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
										<td style="text-indent: 5%; text-align:justify">
											<xsl:choose>
												<xsl:when test="aoir:Answer/aoir:AnswerCode = '1'">
													<xsl:text>В соответствии с законодательством Российской Федерации о таможенном регулировании прошу отменить решение о приостановлении срока выпуска товаров.</xsl:text>
												</xsl:when>
												<xsl:when test="aoir:Answer/aoir:AnswerCode = '3'">
													<xsl:text>В соответствии с законодательством Российской Федерации о таможенном регулировании прошу продлить срок приостановления срока выпуска товаров до </xsl:text>
													<xsl:choose>
														<xsl:when test="aoir:GoodsWithSignOfViolation/aoir:DatePeriod">
															<xsl:apply-templates select="aoir:GoodsWithSignOfViolation/aoir:DatePeriod" mode="date_2"/>
														</xsl:when>
														<xsl:otherwise>ДДММГГ</xsl:otherwise>
													</xsl:choose>.
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<xsl:choose>
										<xsl:when test="aoir:Answer/aoir:AnswerCode = '1' ">
											<xsl:for-each select="aoir:GoodsWithSignOfViolation">
												<tr>
													<td align="center">
														<xsl:text>Характер нарушения прав на объекты интеллектуальной собственности:</xsl:text>
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
																	<td width="22%" align="center" class="value">
																		<xsl:for-each select="aoir:GoodsDescription">
																			<xsl:apply-templates select="."/>
																		</xsl:for-each>
																	</td>
																	<td width="4%"/>
																	<td width="20%" align="center" class="value">
																		<xsl:for-each select="aoir:IPOinfo/aoir:OISName">
																			<xsl:apply-templates select="."/>
																		</xsl:for-each>
																	</td>
																	<td width="4%"/>
																	<td width="20%" align="center" class="value">
																		<xsl:for-each select="aoir:IPOinfo/aoir:IPObjectRegistryIdDetails">
																			<xsl:apply-templates select="."/>
																		</xsl:for-each>
																	</td>
																	<td width="8%" style="vertical-align: bottom; font-size: 7pt">
																		<xsl:text> и (или) </xsl:text>
																	</td>
																	<td width="22%" align="center" class="value">
																		<xsl:apply-templates mode="DocBase" select="aoir:IPOinfo/aoir:IPOInfoDoc"/>
																	</td>
																</tr>
																<tr>
																	<td class="descr">
																		<xsl:text>(наименование товара)</xsl:text>
																	</td>
																	<td/>
																	<td class="descr">
																		<xsl:text>(наименование ОИС)</xsl:text>
																	</td>
																	<td/>
																	<td class="descr">
																		<xsl:text>рег. № по ТРОИС</xsl:text>
																	</td>
																	<td/>
																	<td class="descr">
																		<xsl:text>рег. № по Роспатент/ВОИС/иное</xsl:text>
																		<br/>
																		<xsl:text>(указать)</xsl:text>
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
											</xsl:for-each>
											<tr>
												<td>
													<table width="100%">
														<tbody>
															<tr>
																<td rowspan="2" valign="top" width="5%">
																	<xsl:text>1)</xsl:text>
																</td>
																<td width="86%">
																	<xsl:text>cредства индивидуализации рамещены на товаре (копии </xsl:text>
																</td>
																<td width="4%"/>
																<td align="center" class="bordered" width="5%">
																	<xsl:choose>
																		<xsl:when test="aoir:ReasonCancelRelease/aoir:IndividualToolsPlacedProduct = 'true' or aoir:ReasonCancelRelease/aoir:IndividualToolsPlacedProduct = 't' or aoir:ReasonCancelRelease/aoir:IndividualToolsPlacedProduct = '1'">
																			<b>V</b>
																		</xsl:when>
																	</xsl:choose>
																</td>
															</tr>
															<tr>
																<td class="underlined">
																	<xsl:text>произведений или фонограмм созданы) с согласия правообладателя</xsl:text>
																</td>
																<td/>
																<td/>
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
																<td rowspan="2" valign="top" width="5%">
																	<xsl:text>2)</xsl:text>
																</td>
																<td width="86%">
																	<xsl:text>ввоз в Российскую Федерацию товаров осуществляется</xsl:text>
																</td>
																<td width="4%"/>
																<td align="center" class="bordered" width="5%">
																	<xsl:choose>
																		<xsl:when test="aoir:ReasonCancelRelease/aoir:ImportConsentCopyrightHolder = 'true' or aoir:ReasonCancelRelease/aoir:ImportConsentCopyrightHolder = 't' or aoir:ReasonCancelRelease/aoir:ImportConsentCopyrightHolder = '1'">
																			<b>V</b>
																		</xsl:when>
																	</xsl:choose>
																</td>
															</tr>
															<tr>
																<td class="underlined">
																	<xsl:text>с согласия правообладателя (с соблюдением порядка исчерпания исключительного права на товарный знак)</xsl:text>
																</td>
																<td/>
																<td/>
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
												<td align="center">
													<xsl:text>Дополнительная информация:</xsl:text>
												</td>
											</tr>
											<tr>
												<td>
													<br/>
												</td>
											</tr>
											<tr>
												<td class="bordered">
													<table width="100%">
														<tbody>
															<tr>
																<td valign="middle" width="3%" rowspan="2">
																	<xsl:text>-</xsl:text>
																</td>
																<td width="45%">
																	<xsl:text>декларанту дано письменное</xsl:text>
																</td>
																<td rowspan="2" width="4%"/>
																<td valign="bottom" align="center" rowspan="2" class="value" width="15%">
																	<xsl:apply-templates select="aoir:AddInfoApp/aoir:DocInfoProcDestruction/cat_ru:PrDocumentNumber"/>
																</td>
																<td rowspan="2" width="5%"/>
																<td valign="bottom" align="center" rowspan="2" class="value" width="15%">
																	<xsl:apply-templates mode="date" select="aoir:AddInfoApp/aoir:DocInfoProcDestruction/cat_ru:PrDocumentDate"/>
																</td>
																<td width="3%"/>
																<td width="5%" align="center" class="bordered">
																	<xsl:choose>
																		<xsl:when test="aoir:AddInfoApp/aoir:CustomsProcDestruction = 'true' or aoir:AddInfoApp/aoir:CustomsProcDestruction = 't' or aoir:AddInfoApp/aoir:CustomsProcDestruction = '1'">
																			<b>V</b>
																		</xsl:when>
																	</xsl:choose>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:text>согласие на помещение товаров под таможенную процедуру уничтожения:</xsl:text>
																</td>
																<td/>
																<td/>
															</tr>
															<tr>
																<td colspan="3"/>
																<td class="descr">
																	<xsl:text>(рег. номер обращения)</xsl:text>
																</td>
																<td/>
																<td class="descr">
																	<xsl:text>(дата)</xsl:text>
																</td>
																<td colspan="2"/>
															</tr>
															<tr>
																<td>-</td>
																<td colspan="7">иное:</td>
															</tr>
															<tr>
																<td/>
																<td colspan="6" class="value">
																	<xsl:for-each select="aoir:AddInfoApp/aoir:Other">
																		<xsl:apply-templates select="."/>
																	</xsl:for-each>
																</td>
																<td/>
															</tr>
															<tr>
																<td colspan="8">
																	<br/>
																	<br/>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</xsl:when>
										<xsl:when test="aoir:Answer/aoir:AnswerCode = '3' ">
											<xsl:for-each select="aoir:GoodsWithSignOfViolation">
												<tr>
													<td align="center">
														<xsl:text>Характер нарушения прав на объекты интеллектуальной собственности:</xsl:text>
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
																	<td width="22%" align="center" class="value">
																		<xsl:for-each select="aoir:GoodsDescription">
																			<xsl:apply-templates select="."/>
																		</xsl:for-each>
																	</td>
																	<td width="4%"/>
																	<td width="20%" align="center" class="value">
																		<xsl:for-each select="aoir:IPOinfo/aoir:OISName">
																			<xsl:apply-templates select="."/>
																		</xsl:for-each>
																	</td>
																	<td width="4%"/>
																	<td width="20%" align="center" class="value">
																		<xsl:for-each select="aoir:IPOinfo/aoir:IPObjectRegistryIdDetails">
																			<xsl:apply-templates select="."/>
																		</xsl:for-each>
																	</td>
																	<td width="8%" style="vertical-align: bottom; font-size: 7pt">
																		<xsl:text> и (или) </xsl:text>
																	</td>
																	<td width="22%" align="center" class="value">
																		<xsl:apply-templates mode="DocBase" select="aoir:IPOinfo/aoir:IPOInfoDoc"/>
																	</td>
																</tr>
																<tr>
																	<td class="descr">
																		<xsl:text>(наименование товара)</xsl:text>
																	</td>
																	<td/>
																	<td class="descr">
																		<xsl:text>(наименование ОИС)</xsl:text>
																	</td>
																	<td/>
																	<td class="descr">
																		<xsl:text>рег. № по ТРОИС</xsl:text>
																	</td>
																	<td/>
																	<td class="descr">
																		<xsl:text>рег. № по Роспатент/ВОИС/иное</xsl:text>
																		<br/>
																		<xsl:text>(указать)</xsl:text>
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
																	<td rowspan="2" valign="top" width="5%">
																		<xsl:text>1)</xsl:text>
																	</td>
																	<td width="86%">
																		<xsl:text>Ввоз в Российскую Федерацию без согласия правообладателя</xsl:text>
																	</td>
																	<td width="4%"/>
																	<td align="center" class="bordered" width="5%">
																		<xsl:choose>
																			<xsl:when test="aoir:NatureViolationRights/aoir:ImportNotConsentCopyrightHolder = 'true' or aoir:NatureViolationRights/aoir:ImportNotConsentCopyrightHolder = 't' or aoir:NatureViolationRights/aoir:ImportNotConsentCopyrightHolder = '1'">
																				<b>V</b>
																			</xsl:when>
																		</xsl:choose>
																	</td>
																</tr>
																<tr>
																	<td class="underlined">
																		<xsl:text>(в нарушение принципа исчерпания исключительного права на товарный знак) товаров, содержащих принадлежащие ему товарные знаки ("параллельный импорт")</xsl:text>
																	</td>
																	<td/>
																	<td/>
																</tr>
																<tr>
																	<td rowspan="2" valign="top">
																		<xsl:text>2.1)</xsl:text>
																	</td>
																	<td>
																		<xsl:text>Ввоз (вывоз) в Российскую Федерацию товаров с незаконным</xsl:text>
																	</td>
																	<td/>
																	<td align="center" class="bordered">
																		<xsl:choose>
																			<xsl:when test="aoir:NatureViolationRights/aoir:IllegalPlacement = 'true' or aoir:NatureViolationRights/aoir:IllegalPlacement = 't' or aoir:NatureViolationRights/aoir:IllegalPlacement = '1'">
																				<b>V</b>
																			</xsl:when>
																		</xsl:choose>
																	</td>
																</tr>
																<tr>
																	<td class="underlined">
																		<xsl:text>размещением на них средств индивидуализации (товарные знаки, наименования мест происхождения, географические указания)</xsl:text>
																	</td>
																	<td/>
																	<td/>
																</tr>
																<tr>
																	<td rowspan="2" valign="top">
																		<xsl:text>2.2)</xsl:text>
																	</td>
																	<td>
																		<xsl:text>Ввоз (вывоз) товаров, однородных с товарами правообладателя</xsl:text>
																	</td>
																	<td/>
																	<td align="center" class="bordered">
																		<xsl:choose>
																			<xsl:when test="aoir:NatureViolationRights/aoir:Similar = 'true' or aoir:NatureViolationRights/aoir:Similar = 't' or aoir:NatureViolationRights/aoir:Similar = '1'">
																				<b>V</b>
																			</xsl:when>
																		</xsl:choose>
																	</td>
																</tr>
																<tr>
																	<td class="underlined">
																		<xsl:text> и содержащих обозначения, сходные до степени смешивания со средствами индивидуализации, принадлежащих правообладателю </xsl:text>
																	</td>
																	<td/>
																	<td/>
																</tr>
																<tr>
																	<td rowspan="2" valign="top">
																		<xsl:text>2.3)</xsl:text>
																	</td>
																	<td>
																		<xsl:text>Ввоз (вывоз) товаров, в которых использованы объекты</xsl:text>
																	</td>
																	<td/>
																	<td align="center" class="bordered">
																		<xsl:choose>
																			<xsl:when test="aoir:NatureViolationRights/aoir:CopiesWithoutConsent = 'true' or aoir:NatureViolationRights/aoir:CopiesWithoutConsent = 't' or aoir:NatureViolationRights/aoir:CopiesWithoutConsent = '1'">
																				<b>V</b>
																			</xsl:when>
																		</xsl:choose>
																	</td>
																</tr>
																<tr>
																	<td class="underlined">
																		<xsl:text>авторского права и (или) смежных прав, и которые представляют собой или содержат копии произведений или фонограмм, созданных без согласия правообладателя авторского права и (или) смежных прав</xsl:text>
																	</td>
																	<td/>
																	<td/>
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
											</xsl:for-each>
											<tr>
												<td>
													<br/>
												</td>
											</tr>
											<tr>
												<td>
													<xsl:text>Основания для продления приостановления срока выпуска товаров: </xsl:text>
												</td>
											</tr>
											<tr>
												<td>
													<table width="100%">
														<tbody>
															<tr>
																<td width="4%" valign="top" rowspan="2">
																	<xsl:text>1)</xsl:text>
																</td>
																<td width="49%">
																	<xsl:text>Подано заявление в таможенные</xsl:text>
																</td>
																<td rowspan="2" width="3%"/>
																<td rowspan="2" align="center" class="value" width="18%">
																	<xsl:for-each select="aoir:DocumentsList">
																		<xsl:choose>
																			<xsl:when test="aoir:DocKind='1'">
																				<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</td>
																<td rowspan="2" width="3%"/>
																<td rowspan="2" align="center" class="value" width="15%">
																	<xsl:for-each select="aoir:DocumentsList">
																		<xsl:choose>
																			<xsl:when test="aoir:DocKind='1'">
																				<xsl:apply-templates mode="date" select="cat_ru:PrDocumentDate"/>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</td>
																<td width="3%"/>
																<td align="center" class="bordered" width="5%">
																	<xsl:for-each select="aoir:DocumentsList">
																		<xsl:choose>
																			<xsl:when test="aoir:DocKind='1'">
																				<b>V</b>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</td>
															</tr>
															<tr>
																<td class="underlined">
																	<xsl:text>органы о принятии мер, предусмотренных статьями 6.33, 7.12, 14.10 Кодекса Российской федерации об административных правонарушениях</xsl:text>
																</td>
																<td/>
																<td/>
															</tr>
															<tr>
																<td/>
																<td/>
																<td/>
																<td class="descr">
																	<xsl:text>(рег. номер обращения)</xsl:text>
																</td>
																<td/>
																<td class="descr">
																	<xsl:text>(дата)</xsl:text>
																</td>
																<td/>
																<td/>
															</tr>
															<tr>
																<td valign="top" rowspan="2">
																	<xsl:text>2)</xsl:text>
																</td>
																<td>
																	<xsl:text>Подано обращение в иные</xsl:text>
																</td>
																<td rowspan="2"/>
																<td rowspan="2" align="center" class="value">
																	<xsl:for-each select="aoir:DocumentsList">
																		<xsl:choose>
																			<xsl:when test="aoir:DocKind='2'">
																				<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</td>
																<td rowspan="2"/>
																<td rowspan="2" align="center" class="value">
																	<xsl:for-each select="aoir:DocumentsList">
																		<xsl:choose>
																			<xsl:when test="aoir:DocKind='2'">
																				<xsl:apply-templates mode="date" select="cat_ru:PrDocumentDate"/>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</td>
																<td/>
																<td align="center" class="bordered">
																	<xsl:for-each select="aoir:DocumentsList">
																		<xsl:choose>
																			<xsl:when test="aoir:DocKind='2'">
																				<b>V</b>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</td>
															</tr>
															<tr>
																<td class="underlined">
																	<xsl:text>уполномоченные органы за защитой прав правообладателя</xsl:text>
																</td>
																<td/>
																<td/>
															</tr>
															<tr>
																<td/>
																<td/>
																<td/>
																<td class="descr">
																	<xsl:text>(рег. номер обращения)</xsl:text>
																</td>
																<td/>
																<td class="descr">
																	<xsl:text>(дата)</xsl:text>
																</td>
																<td/>
																<td/>
															</tr>
															<tr>
																<td valign="top" rowspan="2">
																	<xsl:text>3)</xsl:text>
																</td>
																<td>
																	<xsl:text>Необходимость проведения </xsl:text>
																</td>
																<td rowspan="2"/>
																<td rowspan="2" align="center" class="value">
																	<xsl:for-each select="aoir:DocumentsList">
																		<xsl:choose>
																			<xsl:when test="aoir:DocKind='3'">
																				<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</td>
																<td rowspan="2"/>
																<td rowspan="2" align="center" class="value">
																	<xsl:for-each select="aoir:DocumentsList">
																		<xsl:choose>
																			<xsl:when test="aoir:DocKind='3'">
																				<xsl:apply-templates mode="date" select="cat_ru:PrDocumentDate"/>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</td>
																<td/>
																<td align="center" class="bordered">
																	<xsl:for-each select="aoir:DocumentsList">
																		<xsl:choose>
																			<xsl:when test="aoir:DocKind='3'">
																				<b>V</b>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</td>
															</tr>
															<tr>
																<td class="underlined">
																	<xsl:text>исследования, экспертизы товаров, срок выпуска которых приостановлен</xsl:text>
																</td>
																<td/>
																<td/>
															</tr>
															<tr>
																<td/>
																<td/>
																<td/>
																<td class="descr">
																	<xsl:text>(рег. номер обращения)</xsl:text>
																</td>
																<td/>
																<td class="descr">
																	<xsl:text>(дата)</xsl:text>
																</td>
																<td/>
																<td/>
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
												<td align="center">
													<xsl:text>Расчет суммы ущерба:</xsl:text>
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
																<td width="47%" style="text-align: justify">
																	<xsl:text>Размер ущерба, который может быть причинен правообладателю в связи с введением контрафактрой продукции в гражданский оборот составляет: </xsl:text>
																</td>
																<td width="3%"/>
																<td align="center" class="value" width="12%">
																	<xsl:apply-templates select="aoir:AmountDamage/aoir:GoodsQuantity"/>
																</td>
																<td valign="bottom" align="center" width="3%">
																	<xsl:text>х</xsl:text>
																</td>
																<td align="center" class="value" width="12%">
																	<xsl:apply-templates select="aoir:AmountDamage/aoir:Amount"/>
																</td>
																<td valign="bottom" align="center" width="3%">
																	<xsl:text>=</xsl:text>
																</td>
																<td align="center" class="value" width="15%">
																	<xsl:apply-templates select="aoir:AmountDamage/aoir:TotalAmount"/>
																</td>
																<td valign="bottom" align="center" width="5%">
																	<xsl:text>руб.</xsl:text>
																</td>
															</tr>
															<tr>
																<td/>
																<td/>
																<td class="descr">
																	<xsl:text>количество (ед.)</xsl:text>
																</td>
																<td/>
																<td class="descr">
																	<xsl:text>стоимость за ед.</xsl:text>
																</td>
																<td/>
																<td class="descr">
																	<xsl:text>итого</xsl:text>
																</td>
																<td/>
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
												<td align="center">
													<xsl:text>Дополнительная информация: </xsl:text>
													<br/>
													<br/>
												</td>
											</tr>
											<tr>
												<td class="bordered">
													<br/>
													<xsl:for-each select="aoir:AddInfoAppText">
														<xsl:apply-templates select="."/>
													</xsl:for-each>
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
													<table width="100%">
														<tbody>
															<tr>
																<td valign="top" width="20%">
																	<xsl:text>Приложение:</xsl:text>
																</td>
																<td width="80%">
																	<span class="value">
																		<xsl:for-each select="aoir:DocumentsList">
																			<xsl:apply-templates select="." mode="DocBase"/>
																			<xsl:if test="position()!=last()">
																				<xsl:text>;</xsl:text><br/>
																			</xsl:if>
																		</xsl:for-each>
																	</span>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="page_auto">
							<table class="w190">
								<tbody>
									<tr>
										<td align="center" class="graphMain">
											<font size="4">
												<b>
											Ответ правообладателя (его представителя) на уведомление о принятом таможенным органом решении о приостановлении срока выпуска товаров, содержащих признаки нарушения прав интеллектуальной собственности
										</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<xsl:apply-templates select="aoir:Answer"/>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td class="annot graphMain" width="50%">Регистрационный номер ДТ</td>
										<td class="value graphMain" width="50%">
											<xsl:apply-templates select="aoir:NumberDT"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<xsl:apply-templates select="aoir:IPOOwner"/>
							<br/>
							<table>
								<tbody>
									<tr>
										<td colspan="7">
											<b>Товары с признаками нарушения прав интеллектуальной собственности</b>
										</td>
									</tr>
									<tr align="center">
										<td class="graphMain bordered">Ответ правообладателя</td>
										<td class="graphMain bordered">Номер партии товаров / накладной реестра ЭГ</td>
										<td class="graphMain bordered">Номер товара</td>
										<td class="graphMain bordered">Код под ТН ВЭД ЕАЭС</td>
										<td class="graphMain bordered">Признак</td>
										<td class="graphMain bordered">Наименование</td>
										<td class="graphMain bordered">Информация</td>
										<td class="graphMain bordered">Запра- шиваемый срок продления, в днях</td>
										<td class="graphMain bordered">Замечания</td>
									</tr>
									<xsl:for-each select="aoir:GoodsWithSignOfViolation">
										<tr>
											<td class="graphMain bordered">
												<xsl:for-each select="aoir:AnswerCode">
													<xsl:choose>
														<xsl:when test="aoir:AnswerCode='1'">Заявление правообладателя (его представителя) об отмене решения таможенного органа о приостановлении срока выпуска товаров</xsl:when>
														<xsl:when test="aoir:AnswerCode='2'">Заявление о нарушении прав правообладателя (в форме незаконного нанесения средств индивидуализации или нарушения авторских (смежных) прав) и о привлечении таможенным органом импортера/экспортера к установленной ответственности</xsl:when>
														<xsl:when test="aoir:AnswerCode='3'">Заявление о продлении срока приостановления срока выпуска товаров</xsl:when>
														<xsl:when test="aoir:AnswerCode='4'">Иное</xsl:when>
														<xsl:when test="aoir:AnswerCode='*'">Разные по товарам</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="aoir:AnswerCode"/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="aoir:AnswerNumber">
														<br/>
														<xsl:apply-templates mode="document" select="aoir:AnswerNumber"/>
													</xsl:if>
													<xsl:if test="aoir:DecisionNumber">
														<br/>
														<xsl:apply-templates mode="document" select="aoir:DecisionNumber"/>
													</xsl:if>
												</xsl:for-each>
											</td>
											<td class="graphMain bordered">
												<xsl:apply-templates select="aoir:Consigment"/>
											</td>
											<td class="graphMain bordered">
												<xsl:apply-templates select="aoir:GoodsNumeric"/>
											</td>
											<td class="graphMain bordered">
												<xsl:apply-templates select="aoir:GoodsTNVEDCode"/>
											</td>
											<td class="graphMain bordered">
												<xsl:apply-templates select="aoir:IntellectPropertySign"/>
											</td>
											<td class="graphMain bordered">
												<xsl:for-each select="aoir:GoodsDescription">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</td>
											<td class="graphMain bordered">
												<xsl:for-each select="aoir:IPOinfo/*">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</td>
											<td class="graphMain bordered">
												<xsl:apply-templates select="aoir:Period"/>
											</td>
											<td class="graphMain bordered">
												<xsl:apply-templates select="aoir:Notes"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<xsl:if test="aoir:DocumentsList">
								<br/>
								<table>
									<tbody>
										<tr>
											<td>
												<b>Перечень приложеных документов</b>
											</td>
										</tr>
										<xsl:for-each select="aoir:DocumentsList">
											<tr>
												<td>
													<xsl:apply-templates mode="document" select="."/>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text> (</xsl:text>
			</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">,&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">, <xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:PersonId"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:CommunicationDetails">, контактные данные: <xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="aoir:RightHolderForeignLegal">
			<br>
				<xsl:apply-templates select="aoir:RightHolderForeignLegal" mode="ForeignOrganization"/>
			</br>
		</xsl:if>
		<xsl:if test="aoir:RightHolderLegal">
			<br>
				<xsl:apply-templates select="aoir:RightHolderLegal"/>
			</br>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:apply-templates select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic">по справ. </span>
			<xsl:apply-templates select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:apply-templates select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:apply-templates select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="identity">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="date"/>
					<!--xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template-->
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>(окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="date"/>
					<!--xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template-->
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
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
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="CustomsOffice" match="*">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> (</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="DocBase" match="*">
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
					<xsl:apply-templates select="." mode="date"/>
				</xsl:when>
				<xsl:when test="local-name(.)='DocCode'">
					<xsl:text> (</xsl:text>
					<xsl:apply-templates select="."/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="local-name(.)='Reason'">
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="."/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="ForeignOrganization" match="*">
		<xsl:apply-templates select="aoir:FullNameForeign"/>
		<xsl:if test="aoir:ShortNameForeign">(<xsl:apply-templates select="aoir:ShortNameForeign"/>)</xsl:if>
		<xsl:if test="aoir:OPFRus">, <xsl:apply-templates select="aoir:OPFRus"/>
		</xsl:if>/<xsl:apply-templates select="aoir:OPFForeign"/>
		<xsl:if test="aoir:FullAddressForeign">,<xsl:apply-templates select="aoir:FullAddressForeign"/>
		</xsl:if>
		<xsl:if test="aoir:RegistrationOrganName">, зарегистрирован: <xsl:apply-templates select="aoir:RegistrationOrganName"/>
		</xsl:if>
		<xsl:if test="aoir:RegistrationDocumentNumber"> №<xsl:apply-templates select="aoir:RegistrationDocumentNumber"/>
		</xsl:if>
		<xsl:if test="aoir:RegistrationDate">
			<xsl:apply-templates mode="date" select="aoir:RegistrationDate"/>
		</xsl:if>
		<xsl:if test="aoir:RegistrationPlace">,<xsl:apply-templates select="aoir:RegistrationPlace"/>
		</xsl:if>
		<xsl:if test="aoir:DocRegistration">,<xsl:apply-templates select="aoir:DocRegistration"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="aoir:RightHolderLegal">
		<xsl:if test="aoir:INNCertificateDate">дата постановки на учет:<xsl:apply-templates mode="date" select="aoir:INNCertificateDate"/>
		</xsl:if>
		<xsl:if test="aoir:RegistrationNumber">, номер государственной регистрации: <xsl:apply-templates select="aoir:RegistrationNumber"/>
		</xsl:if>
		<xsl:if test="aoir:RegistrationDate"> от<xsl:apply-templates mode="date" select="aoir:RegistrationDate"/>
		</xsl:if>
		<xsl:if test="aoir:LegalLocation">, <xsl:apply-templates mode="address" select="aoir:LegalLocation"/>
		</xsl:if>
	</xsl:template>
	<!-- Информация о правообладателе -->
	<xsl:template match="aoir:IPOOwner">
		<table>
			<tbody>
				<tr>
					<td colspan="2" class="graphMain">
						<b>Информация о правообладателе</b>
					</td>
				</tr>
				<tr>
					<td class="annot graphMain" width="50%">Наименование</td>
					<td class="value graphMain" width="50%">
						<xsl:apply-templates select="cat_ru:OrganizationName"/>
						<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
							<xsl:apply-templates select="cat_ru:ShortName"/>
						</xsl:if>
					</td>
				</tr>
				<xsl:for-each select="cat_ru:RFOrganizationFeatures">
					<xsl:if test="cat_ru:OGRN">
						<tr>
							<td class="annot graphMain">ОГРН</td>
							<td class="value graphMain">
								<xsl:apply-templates select="cat_ru:OGRN"/>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="cat_ru:INN">
						<tr>
							<td class="annot graphMain">ИНН</td>
							<td class="value graphMain">
								<xsl:apply-templates select="cat_ru:INN"/>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="cat_ru:KPP">
						<tr>
							<td class="annot graphMain">КПП</td>
							<td class="value graphMain">
								<xsl:apply-templates select="cat_ru:KPP"/>
							</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<tr>
						<td class="annot graphMain">Адрес</td>
						<td class="value graphMain">
							<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">; </xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCard">
					<tr>
						<td class="annot graphMain">Документ, удостоверящий личность</td>
						<td class="value graphMain">
							<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="RUScat_ru:CommunicationDetails">
					<tr>
						<td class="annot graphMain">Контакты</td>
						<td class="value graphMain">
							<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td class="annot graphMain">Тип заявителя/правообладателя</td>
					<td class="value graphMain">
						<xsl:choose>
							<xsl:when test="aoir:PersonType='01'">ФЛ</xsl:when>
							<xsl:when test="aoir:PersonType='02'">ЮЛ</xsl:when>
							<xsl:when test="aoir:PersonType='03'">ТП</xsl:when>
							<xsl:when test="aoir:PersonType='04'">ИГ</xsl:when>
							<xsl:when test="aoir:PersonType='05'">ИЮЛ</xsl:when>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<td class="annot graphMain">Идентификатор заявителя/правообладателя</td>
					<td class="value graphMain">
						<xsl:apply-templates select="aoir:PersonID"/>
					</td>
				</tr>
				<xsl:if test="aoir:BirthDate">
					<tr>
						<td class="annot graphMain">Дата рождения</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:BirthDate" mode="date"/>
							<!--<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="aoir:BirthDate"/>
							</xsl:call-template>-->
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:BirthPlace">
					<tr>
						<td class="annot graphMain">Место рождения</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:BirthPlace"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:PersonPostalAddress">
					<tr>
						<td class="annot graphMain">Почтовый адрес</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:PersonPostalAddress"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:Phone">
					<tr>
						<td class="annot graphMain">Телефон</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:Phone"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:Email">
					<tr>
						<td class="annot graphMain">Электронная почта</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:Email"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:Fax">
					<tr>
						<td class="annot graphMain">Факс</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:Fax"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:RightHolderLegal">
					<tr>
						<td class="annot graphMain" colspan="2">
							<i>Сведения о юридическом лице</i>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Дата постановки на учет</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderLegal/aoir:INNCertificateDate" mode="date"/>
							<!--<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="aoir:RightHolderLegal/aoir:INNCertificateDate"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Номер государственной регистрации</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderLegal/aoir:RegistrationNumber"/>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Дата государственной регистрации</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderLegal/aoir:RegistrationDate" mode="date"/>
							<!--<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="aoir:RightHolderLegal/aoir:RegistrationDate"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Юридический адрес</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderLegal/aoir:LegalLocation"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="aoir:RightHolderForeignLegal">
					<tr>
						<td class="annot graphMain" colspan="2">
							<i>Сведения об иностранном юридическом лице</i>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Полное наименование на иностранном языке</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderForeignLegal/aoir:FullNameForeign"/>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Сокращенное наименование на иностранном языке</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderForeignLegal/aoir:ShortNameForeign"/>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Организационно-правовая форма</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderForeignLegal/aoir:OPFRus"/>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Организационно-правовая форма (в латинской транскрипции)</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderForeignLegal/aoir:OPFForeign"/>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Наименование органа, зарегистрировавшего организацию</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderForeignLegal/aoir:RegistrationOrganName"/>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Номер документа регистрации</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderForeignLegal/aoir:RegistrationDocumentNumber"/>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Дата регистрации</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderForeignLegal/aoir:RegistrationDate" mode="date"/>
							<!--<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="aoir:RightHolderForeignLegal/aoir:RegistrationDate"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Место регистрации</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderForeignLegal/aoir:RegistrationPlace"/>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain">Полный адрес организации (на иностранном языке)</td>
						<td class="value graphMain">
							<xsl:apply-templates select="aoir:RightHolderForeignLegal/aoir:FullAddressForeign"/>
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:apply-templates select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
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
								<xsl:otherwise>(код вида адреса: <xsl:apply-templates select="."/>) </xsl:otherwise>
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
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Контакты -->
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Документ, удостоверяющий личность -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:apply-templates select="." mode="date"/>
					<!--<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>-->
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="cat_ru:Address|aoir:PersonPostalAddress|aoir:LegalLocation">
		<xsl:for-each select="*">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Ответ -->
	<xsl:template match="aoir:Answer">
		<xsl:if test="aoir:AnswerCode">
			<tr>
				<td class="annot graphMain" width="50%">Вид ответа</td>
				<td class="value grapnMain" width="50%">
					<xsl:choose>
						<xsl:when test="aoir:AnswerCode='1'">Заявление правообладателя (его представителя) об отмене решения таможенного органа о приостановлении срока выпуска товаров</xsl:when>
						<xsl:when test="aoir:AnswerCode='2'">Заявление о нарушении прав правообладателя (в форме незаконного нанесения средств индивидуализации или нарушения авторских (смежных) прав) и о привлечении таможенным органом импортера/экспортера к установленной ответственности</xsl:when>
						<xsl:when test="aoir:AnswerCode='3'">Заявление о продлении срока приостановления срока выпуска товаров</xsl:when>
						<xsl:when test="aoir:AnswerCode='4'">Иное</xsl:when>
						<xsl:when test="aoir:AnswerCode='*'">Разные по товарам</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="aoir:AnswerCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="aoir:AnswerNumber">
			<tr>
				<td class="annot graphMain" width="50%">Номер и дата ответа правообладателя</td>
				<td class="value grapnMain" width="50%">
					<xsl:apply-templates mode="document" select="aoir:AnswerNumber"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="aoir:DecisionNumber">
			<tr>
				<td class="annot graphMain" width="50%">Номер и дата решения таможенного органа, на которое отвечает правообладатель</td>
				<td class="value grapnMain" width="50%">
					<xsl:apply-templates mode="document" select="aoir:DecisionNumber"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<!-- номер ДТ -->
	<xsl:template match="aoir:NumberDT">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="DTdate"/>
		<!--<xsl:call-template name="DTdate">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>-->
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="RUScat_ru:AddNumber"/>
	</xsl:template>
	<!-- документ (название, номер, дата) -->
	<xsl:template match="cat_ru:ITN">
		<xsl:text> (Код категория лица: </xsl:text>
		<xsl:apply-templates select="cat_ru:CategoryCode"/>
		<xsl:text> Код КАТО: </xsl:text>
		<xsl:apply-templates select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text> РНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:RNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<xsl:text> Резерв: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITNReserv"/>
		</xsl:if>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН/ПИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text> ОКПО: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text> НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text> Номер справки об отсутствии НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> Идентификационный номер физического лица: </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП: </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text> ИИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text> Идентификационный таможенный номер: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="document">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
			<!--<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>-->
		</xsl:if>
		<xsl:if test="aoir:DocCode">
			<xsl:text>, код документа: </xsl:text>
			<xsl:apply-templates select="aoir:DocCode"/>
		</xsl:if>
		<xsl:if test="aoir:Reason">
			<xsl:text>, причина непредоставления: </xsl:text>
			<xsl:apply-templates select="aoir:Reason"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="DTdate">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="DTdate">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="DTdate">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
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
	<xsl:template match="*" mode="date_2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_year2">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
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
	<xsl:template name="russian_date_year2">
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
</xsl:stylesheet>
