<?xml version="1.0" encoding="utf-8"?>
<!-- ExpressRegistryKindCode='ДТЭГ' - Решение Коллегии ЕЭК от 28.08.2018 № 142
ExpressRegistryKindCode='ПДТЭГ' - Решение Коллегии ЕЭК от 16.10.2018 № 158 (ред. Решение Коллегии ЕЭК от 27.06.2023 № 85) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:ecd="urn:customs.ru:Information:CustomsDocuments:ExpressCargoDeclaration:5.28.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:ecdcm="urn:customs.ru:Information:CustomsDocuments:ExpressCargoDeclarationCustomMark:5.24.0">
	<xsl:param name="ExpressCargoDeclarationCustomMark"/>
	<!-- Шаблон для типа ExpressCargoDeclarationType -->
	<xsl:key name="uniquePDD" use="." match="ecd:PrecedingDocDetails"/>
	<xsl:template match="ecd:ExpressCargoDeclaration">
		<xsl:param name="w" select="277"/>
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
                  padding: 10mm 10mm 10mm 10mm;
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
                  /*margin-top: 1px;*/
                  margin: 0px;
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
                  td.bordered_fat2
                  {
                  border-top: solid 3px windowtext;
                  border-bottom: solid 3px windowtext;
                  border-right: solid 1px windowtext;
                  border-left: solid 1px windowtext;
                  }
                  td.bordered_fat3
                  {
                  border-top: solid 4px windowtext;
                  border-bottom: solid 4px windowtext;
                  border-right: solid 1px windowtext;
                  border-left: solid 1px windowtext;
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
				<div class="page">
					<xsl:if test="ecd:DocType = '0'">
						<xsl:if test="ecd:ExpressRegistryKindCode = 'ДТЭГ'">
							<table cellpadding="4">
								<tbody>
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
									</tr>
									<tr>
										<td colspan="16" style="border-top:1px solid black;border-left:1px solid black; border-right:1px solid black;" align="center" valign="middle">
											<b>Декларация на товары для экспресс-грузов</b>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" colspan="4" rowspan="2">Отправитель (по общей накладной)<br/>
											<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsignorDetails"/>
										</td>
										<td class="bordered" colspan="3" rowspan="2">Получатель (по общей накладной)<br/>
											<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsigneeDetails"/>
										</td>
										<td colspan="5" class="bordered">
											<xsl:text>A</xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="ecd:ExpressCargoDeclarationIdDetails">
													<xsl:apply-templates mode="reg_num" select="ecd:ExpressCargoDeclarationIdDetails"/>
													<xsl:text>/</xsl:text>
													<xsl:variable name="numPP" select="concat('00', ecd:NumPP)"/>
													<xsl:value-of select="substring($numPP, string-length($numPP) - 1)"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="$ExpressCargoDeclarationCustomMark">
														<xsl:apply-templates mode="reg_num" select="$ExpressCargoDeclarationCustomMark/ecdcm:ApplicationRegNumber"/>
														<xsl:text>/</xsl:text>
														<xsl:variable name="numPP" select="concat('00', ecd:NumPP)"/>
														<xsl:value-of select="substring($numPP, string-length($numPP) - 1)"/>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
											
										</td>
										<td colspan="2" class="bordered">ДТЭГ<br/>
											<xsl:apply-templates select="ecd:ElectronicDocumentSign"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:DeclarationKindCode"/>
										</td>
										<td colspan="2" class="bordered">Особенность<br/>
											<xsl:apply-templates select="ecd:DeclarationKind"/>
										</td>
									</tr>
									<tr valign="top">
										<td colspan="5" class="bordered">Предшествующий документ<br/>
											<xsl:apply-templates select="//ecd:PrecedingDocDetails[generate-id() = generate-id(key('uniquePDD', .)[1])]"/>
										</td>
										<td colspan="2" class="bordered">Кол-во листов <xsl:value-of select="ecd:TotalSheetNumber"/>
										</td>
										<td colspan="2" class="bordered">Процедура<br/>
											<xsl:apply-templates select="ecd:CustomsModeCode"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:PreviousCustomsModeCode"/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered" colspan="5">Общие сведения</td>
										<td class="bordered" colspan="8">Сведения о товарах</td>
										<td class="bordered" colspan="2">Сведения о документах</td>
										<td class="bordered">Примечание</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered" rowspan="2">N п/п</td>
										<td class="bordered" rowspan="2">Общая накладная</td>
										<td class="bordered" rowspan="2">Инд. накладная</td>
										<td class="bordered" rowspan="2">Инд. отправитель<sup>1</sup>
										</td>
										<td class="bordered" rowspan="2">Инд. получатель<sup>2</sup>
										</td>
										<td class="bordered" rowspan="2">N п/п</td>
										<td class="bordered" rowspan="2">Наименование</td>
										<td class="bordered" rowspan="2">Код ТН ВЭД ЕАЭС</td>
										<td class="bordered" rowspan="2">Кол-во</td>
										<td class="bordered" colspan="2">Вес</td>
										<td class="bordered" rowspan="2">Валюта, стоимость</td>
										<td class="bordered" rowspan="2">Таможенная стоимость</td>
										<td class="bordered" rowspan="2">Код, признак</td>
										<td class="bordered" rowspan="2">Дата, номер</td>
										<td class="bordered" rowspan="3"/>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered">брутто</td>
										<td class="bordered">нетто</td>
									</tr>
									<tr align="center">
										<td class="bordered">1</td>
										<td class="bordered">2</td>
										<td class="bordered">3</td>
										<td class="bordered">4</td>
										<td class="bordered">5</td>
										<td class="bordered">6</td>
										<td class="bordered">7</td>
										<td class="bordered">8</td>
										<td class="bordered">9</td>
										<td class="bordered">10</td>
										<td class="bordered">11</td>
										<td class="bordered">12</td>
										<td class="bordered">13</td>
										<td class="bordered">14</td>
										<td class="bordered">15</td>
									</tr>
									<xsl:for-each select="ecd:GoodsShipment/ecd:HouseShipment">
										<xsl:variable name="rowspan" select="count(ecd:GoodsItemDetails[not(ecd:PresentedDocDetails)])+count(ecd:GoodsItemDetails/ecd:PresentedDocDetails)"/>
										<tr align="center" valign="top">
											<td class="bordered">
												<xsl:if test="$rowspan &gt; 0">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan+1"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates select="ecd:ObjectOrdinal"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="doc" select="ecd:TransportDocumentDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="doc" select="ecd:HouseWaybillDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="org" select="ecd:ConsignorDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="org" select="ecd:ConsigneeDetails"/>
											</td>
											<xsl:if test="not(ecd:GoodsItemDetails)">
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
											</xsl:if>
											<xsl:apply-templates select="ecd:GoodsItemDetails[1]" mode="dt"/>
										</tr>
										<xsl:for-each select="ecd:GoodsItemDetails[position() = 1]">
											<xsl:for-each select="ecd:PresentedDocDetails[position() &gt; 1]">
												<tr align="center" valign="top">
													<xsl:apply-templates select="."/>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="ecd:GoodsItemDetails[position() &gt; 1]">
											<tr align="center" valign="top">
												<xsl:apply-templates select="." mode="dt"/>
											</tr>
											<xsl:for-each select="ecd:PresentedDocDetails[position() &gt; 1]">
												<tr align="center" valign="top">
													<xsl:apply-templates select="."/>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<tr align="center" valign="top">
											<td class="bordered_fat2" colspan="8" align="left">
												Всего по индивидуальной накладной<br/>(общий вес брутто, таможенная стоимость)
											</td>
											<td class="bordered_fat2">
												<xsl:apply-templates mode="quantity" select="ecd:UnifiedGrossWeightQuantity"/>
											</td>
											<td class="bordered_fat2" colspan="2"/>
											<td class="bordered_fat2">
												<xsl:apply-templates mode="pricevalue" select="ecd:CustomsCost"/>
											</td>
											<td class="bordered_fat2" colspan="3"/>
										</tr>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered_fat3" colspan="9" align="left">
												Всего по декларации на товары для экспресс-грузов<br/>(общий вес брутто, таможенная стоимость)
											</td>
										<td class="bordered_fat3">
											<xsl:apply-templates mode="quantity" select="ecd:GoodsShipment/ecd:UnifiedGrossWeightQuantity"/>
										</td>
										<td class="bordered_fat3" colspan="2"/>
										<td class="bordered_fat3">
											<xsl:apply-templates mode="pricevalue" select="ecd:GoodsShipment/ecd:CustomsCost"/>
										</td>
										<td class="bordered_fat3" colspan="3"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table cellpadding="4">
								<tbody>
									<xsl:variable name="cnt_GoodsItemDetails" select="count(ecd:GoodsShipment/ecd:HouseShipment/ecd:GoodsItemDetails/ecd:CustomsPaymentDetails)+count(ecd:GoodsShipment/ecd:HouseShipment)+4"/>
									<xsl:variable name="row_part1" select="number($cnt_GoodsItemDetails)-number(2)"/>
									<tr align="center" valign="top">
										<td class="bordered" colspan="6">B. Исчисление платежей</td>
										<td class="bordered" align="left" rowspan="{$row_part1}">Сведения о лице, заполнившем ДТЭГ, дата
											<br/>
											<br/>
											<xsl:apply-templates select="ecd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode"/>
											<xsl:if test="ecd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode and ecd:BrokerRegistryDocDetails/RUScat_ru:RegistrationNumberId">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:apply-templates select="ecd:BrokerRegistryDocDetails/RUScat_ru:RegistrationNumberId"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonMiddleName"/>
											<br/>
											<xsl:apply-templates mode="identitycard" select="ecd:SignatoryPerson/ecd:SignatoryPersonIdentityDetails"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonPost"/>
											<br/>
											<xsl:if test="ecd:SignatoryPerson/ecd:SigningDetails/RUScat_ru:SigningDate">
												<xsl:apply-templates mode="russian_date" select="ecd:SignatoryPerson/ecd:SigningDetails/RUScat_ru:SigningDate"/>
												<br/>
											</xsl:if>
											<!--xsl:apply-templates select="ecd:SignatoryPerson/ecd:PowerOfAttorneyDetails/catESAD_cu:DocKindCode"/-->
											<xsl:if test="ecd:SignatoryPerson/ecd:PowerOfAttorneyDetails"><br/></xsl:if>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:PowerOfAttorneyDetails"/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered">Товар</td>
										<td class="bordered">Вид</td>
										<td class="bordered">База для исчисления</td>
										<td class="bordered">Код базы для исчисления</td>
										<td class="bordered">Ставка</td>
										<td class="bordered">Сумма</td>
									</tr>
									<tr align="center">
										<td class="bordered">1</td>
										<td class="bordered">2</td>
										<td class="bordered">3</td>
										<td class="bordered">4</td>
										<td class="bordered">5</td>
										<td class="bordered">6</td>
									</tr>
									<xsl:for-each select="ecd:GoodsShipment/ecd:HouseShipment">
										<xsl:variable name="party" select="."/>
										<xsl:variable name="cnt1_CustomsPaymentDetails" select="count(ecd:CustomsPaymentDetails)"/>
										<xsl:for-each select="ecd:CustomsPaymentDetails">
											<tr align="center">
												<xsl:if test="position()=1">
													<td class="bordered" rowspan="{$cnt1_CustomsPaymentDetails}"/>
												</xsl:if>
												<td class="bordered">
													<xsl:apply-templates select="RUDECLcat:PaymentModeCode"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates select="RUDECLcat:TaxBase"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates select="RUDECLcat:TaxBaseCurrencyCode"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates mode="rate1" select="."/>
												</td>
												<td class="bordered">
													<xsl:apply-templates select="RUDECLcat:PaymentAmount"/>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ecd:GoodsItemDetails">
											<xsl:variable name="partyDetails" select="."/>
											<xsl:variable name="cnt_CustomsPaymentDetails" select="count(ecd:CustomsPaymentDetails)"/>
											<xsl:for-each select="ecd:CustomsPaymentDetails">
												<tr align="center">
													<xsl:if test="position()=1">
														<td class="bordered" rowspan="{$cnt_CustomsPaymentDetails}">
															<xsl:value-of select="$party/ecd:ObjectOrdinal"/>
															<xsl:text>/</xsl:text>
															<xsl:value-of select="$partyDetails/ecd:GoodsNumeric"/>
														</td>
													</xsl:if>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:PaymentModeCode"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:TaxBase"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:TaxBaseCurrencyCode"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates mode="rate1" select="."/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:PaymentAmount"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<tr align="center" valign="top">
											<td class="bordered_fat2">
												Всего по индивидуальной накладной
											</td>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2">
												<xsl:variable name="sum_1" select="sum(ecd:GoodsItemDetails/ecd:CustomsPaymentDetails/RUDECLcat:PaymentAmount)"/>
												<xsl:variable name="sum_2" select="sum(ecd:CustomsPaymentDetails/RUDECLcat:PaymentAmount)"/>
												<xsl:variable name="sum_total" select="$sum_1 + $sum_2"/>
												<xsl:value-of select="round($sum_total * 100) div 100"/>
											</td>
											<xsl:if test="position()=last()">
												<td class="bordered" align="left" rowspan="2">
													<xsl:text>C</xsl:text>
													<br/>
													<xsl:if test="$ExpressCargoDeclarationCustomMark">
														
													</xsl:if>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered_fat3">
											Всего по декларации на товары для экспресс-грузов
										</td>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3">
											<xsl:value-of select="ecd:GoodsShipment/ecd:TotalPaymentAmountDetails/RUScat_ru:Amount"/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="6">
											<div width="100%" align="center">B1. Подробности уплаты (взыскания)</div>
											<br/>
											<xsl:for-each select="ecd:GoodsShipment/ecd:FactCustomsPayment">
												<xsl:if test="position()!=1">
													<br/>
												</xsl:if>
												<xsl:apply-templates select="catESAD_cu:PaymentModeCode"/>
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="catESAD_cu:PaymentAmount"/>
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="catESAD_cu:PaymentCurrencyCode"/>
												<xsl:text> - </xsl:text>
												<xsl:choose>
													<xsl:when test="ecd:PaymentDocument/cat_ru:PrDocumentNumber">
														<xsl:apply-templates select="ecd:PaymentDocument/cat_ru:PrDocumentNumber"/>
													</xsl:when>
													<xsl:otherwise>--</xsl:otherwise>
												</xsl:choose>
												<xsl:text> - </xsl:text>
												<xsl:choose>
													<xsl:when test="ecd:PaymentDocument/cat_ru:PrDocumentDate">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="ecd:PaymentDocument/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>--</xsl:otherwise>
												</xsl:choose>
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="ecd:PaymentWayCode"/>
												<xsl:if test="ecd:RFOrganizationFeatures/cat_ru:INN">
													<xsl:text> - </xsl:text>
													<xsl:apply-templates select="ecd:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td class="bordered" align="left" rowspan="3" valign="top">D</td>
									</tr>
								</tbody>
							</table>
						</xsl:if>
						<xsl:if test="ecd:ExpressRegistryKindCode = 'ПТДЭГ'">
							<table cellpadding="4">
								<tbody>
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
									</tr>
									<tr>
										<td colspan="17" style="border-top:1px solid black;border-left:1px solid black; border-right:1px solid black;" align="center" valign="middle">
											<b>Пассажирская таможенная декларация для экспресс-грузов</b>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" colspan="5" rowspan="3">Отправитель (по общей накладной)<br/>
											<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsignorDetails"/>
										</td>
										<td class="bordered" colspan="3" rowspan="3">Получатель (по общей накладной)<br/>
											<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsigneeDetails"/>
										</td>
										<td class="bordered" colspan="3" rowspan="2">
											<xsl:text>A</xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="ecd:ExpressCargoDeclarationIdDetails">
													<xsl:apply-templates mode="reg_num" select="ecd:ExpressCargoDeclarationIdDetails"/>
													<xsl:text>/</xsl:text>
													<xsl:variable name="numPP" select="concat('00', ecd:NumPP)"/>
													<xsl:value-of select="substring($numPP, string-length($numPP) - 1)"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="$ExpressCargoDeclarationCustomMark">
														<xsl:apply-templates mode="reg_num" select="$ExpressCargoDeclarationCustomMark/ecdcm:ApplicationRegNumber"/>
														<xsl:text>/</xsl:text>
														<xsl:variable name="numPP" select="concat('00', ecd:NumPP)"/>
														<xsl:value-of select="substring($numPP, string-length($numPP) - 1)"/>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="bordered" colspan="3" rowspan="3">Место нахождения товаров<br/>
											<xsl:apply-templates select="ecd:GoodsShipment/ecd:GoodsLocationDetails"/>
										</td>
										<td class="bordered" colspan="2">ПТДЭГ</td>
										<td class="bordered" rowspan="2">Особенность<br/>
											<xsl:apply-templates select="ecd:DeclarationKind"/>
										</td>
									</tr>
									<tr>
										<td style="border-right: 1px solid black;">
											<xsl:apply-templates select="ecd:DeclarationKindCode"/>
										</td>
										<td>
											<xsl:apply-templates select="ecd:ElectronicDocumentSign"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" colspan="3">Предшествующий&#160;документ<br/>
											<xsl:apply-templates select="//ecd:PrecedingDocDetails[generate-id() = generate-id(key('uniquePDD', .)[1])]"/>
										</td>
										<td class="bordered" colspan="3">Кол-во листов <xsl:value-of select="ecd:TotalSheetNumber"/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered" colspan="5">Общие сведения</td>
										<td class="bordered" colspan="7">Сведения о товарах</td>
										<td class="bordered" colspan="2">Сведения о документах</td>
										<td class="bordered" colspan="3" rowspan="3">Примечание</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered">N п/п</td>
										<td class="bordered">Общая накладная</td>
										<td class="bordered">Инд. накладная</td>
										<td class="bordered">Инд. отправитель<sup>1</sup>
										</td>
										<td class="bordered">Инд. получатель<sup>2</sup>
										</td>
										<td class="bordered">N п/п</td>
										<td class="bordered">Наименование</td>
										<td class="bordered">Код ТН ВЭД ЕАЭС</td>
										<td class="bordered">Кол-во</td>
										<td class="bordered">Вес брутто</td>
										<td class="bordered">Валюта, стоимость</td>
										<td class="bordered">Валюта, стоимость в валюте государства-члена</td>
										<td class="bordered">Код, признак</td>
										<td class="bordered">Дата, номер</td>
									</tr>
									<tr align="center">
										<td class="bordered">1</td>
										<td class="bordered">2</td>
										<td class="bordered">3</td>
										<td class="bordered">4</td>
										<td class="bordered">5</td>
										<td class="bordered">6</td>
										<td class="bordered">7</td>
										<td class="bordered">8</td>
										<td class="bordered">9</td>
										<td class="bordered">10</td>
										<td class="bordered">11</td>
										<td class="bordered">12</td>
										<td class="bordered">13</td>
										<td class="bordered">14</td>
									</tr>
									<xsl:for-each select="ecd:GoodsShipment/ecd:HouseShipment">
										<xsl:variable name="rowspan_p" select="count(ecd:GoodsItemDetails[not(ecd:PresentedDocDetails)])+count(ecd:GoodsItemDetails/ecd:PresentedDocDetails)"/>
										<tr align="center" valign="top">
											<td class="bordered">
												<xsl:if test="$rowspan_p &gt; 0">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p+1"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates select="ecd:ObjectOrdinal"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan_p &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="doc" select="ecd:TransportDocumentDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan_p &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="doc" select="ecd:HouseWaybillDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan_p &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="org" select="ecd:ConsignorDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan_p &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="org" select="ecd:ConsigneeDetails"/>
											</td>
											<xsl:if test="not(ecd:GoodsItemDetails)">
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
											</xsl:if>
											<xsl:apply-templates select="ecd:GoodsItemDetails[1]" mode="ptd"/>
										</tr>
										<xsl:for-each select="ecd:GoodsItemDetails[position() = 1]">
											<xsl:for-each select="ecd:PresentedDocDetails[position() &gt; 1]">
												<tr align="center" valign="top">
													<xsl:apply-templates select="."/>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="ecd:GoodsItemDetails[position() &gt; 1]">
											<tr align="center" valign="top">
												<xsl:apply-templates select="." mode="ptd"/>
											</tr>
											<xsl:for-each select="ecd:PresentedDocDetails[position() &gt; 1]">
												<tr align="center" valign="top">
													<xsl:apply-templates select="."/>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<tr align="center" valign="top">
											<td class="bordered_fat2" colspan="8" align="left">
												Всего по индивидуальной накладной<br/>(общий вес брутто, стоимость в валюте государства-члена)
											</td>
											<td class="bordered_fat2">
												<xsl:apply-templates mode="quantity" select="ecd:UnifiedGrossWeightQuantity"/>
											</td>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2">
												<xsl:apply-templates mode="pricevalue" select="ecd:CAValueAmount"/>
											</td>
											<td class="bordered_fat2" colspan="5"/>
										</tr>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered_fat3" colspan="9" align="left">
												Всего по пассажирской таможенной декларации для экспресс-грузов<br/>(общий вес брутто, стоимость в валюте государства-члена)
											</td>
										<td class="bordered_fat3">
											<xsl:apply-templates mode="quantity" select="ecd:GoodsShipment/ecd:UnifiedGrossWeightQuantity"/>
										</td>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3">
											<xsl:apply-templates mode="pricevalue" select="ecd:GoodsShipment/ecd:CAValueAmount"/>
										</td>
										<td class="bordered_fat3" colspan="5"/>
									</tr>
									<tr>
										<td colspan="17">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="17">Сведения о лице, заполнившем ПТДЭГ, дата
											<br/>
											<br/>
											<xsl:apply-templates select="ecd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode"/>
											<xsl:if test="ecd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode and ecd:BrokerRegistryDocDetails/RUScat_ru:RegistrationNumberId">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:apply-templates select="ecd:BrokerRegistryDocDetails/RUScat_ru:RegistrationNumberId"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonMiddleName"/>
											<br/>
											<xsl:apply-templates mode="identitycard" select="ecd:SignatoryPerson/ecd:SignatoryPersonIdentityDetails"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonPost"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:PowerOfAttorneyDetails/catESAD_cu:DocKindCode"/>
											<br/>
											<xsl:apply-templates mode="russian_date" select="ecd:SignatoryPerson/ecd:SigningDetails/RUScat_ru:SigningDate"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/RUScat_ru:CommunicationDetails"/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="17" valign="top">C<br/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="17" valign="top">D<br/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:if>
					</xsl:if>
					<xsl:if test="ecd:DocType = '1'">
						<xsl:if test="ecd:ExpressRegistryKindCode = 'КДТЭГ'">
							<table cellpadding="4">
								<tbody>
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
									</tr>
									<tr>
										<td colspan="16" style="border-top:1px solid black;border-left:1px solid black; border-right:1px solid black;" align="center" valign="middle">
											<b>Корректировка декларации на товары для экспресс-грузов</b>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" colspan="4" rowspan="2">Отправитель (по общей накладной)<br/>
											<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsignorDetails"/>
										</td>
										<td class="bordered" colspan="3" rowspan="2">Получатель (по общей накладной)<br/>
											<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsigneeDetails"/>
										</td>
										<td colspan="5" class="bordered">
											<xsl:text>A</xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="ecd:ExpressCargoDeclarationIdDetails">
													<xsl:apply-templates mode="reg_num" select="ecd:ExpressCargoDeclarationIdDetails"/>
													<xsl:text>/</xsl:text>
													<xsl:variable name="numPP" select="concat('00', ecd:NumPP)"/>
													<xsl:value-of select="substring($numPP, string-length($numPP) - 1)"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="$ExpressCargoDeclarationCustomMark">
														<xsl:apply-templates mode="reg_num" select="$ExpressCargoDeclarationCustomMark/ecdcm:ApplicationRegNumber"/>
														<xsl:text>/</xsl:text>
														<xsl:variable name="numPP" select="concat('00', ecd:NumPP)"/>
														<xsl:value-of select="substring($numPP, string-length($numPP) - 1)"/>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td colspan="2" class="bordered">КДТЭГ<br/>
											<xsl:apply-templates select="ecd:ElectronicDocumentSign"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:DeclarationKindCode"/>
										</td>
										<td colspan="2" class="bordered">Особенность<br/>
											<xsl:apply-templates select="ecd:DeclarationKind"/>
										</td>
									</tr>
									<tr valign="top">
										<td colspan="5" class="bordered">Предшествующий документ<br/>
											<xsl:apply-templates select="//ecd:PrecedingDocDetails[generate-id() = generate-id(key('uniquePDD', .)[1])]"/>
										</td>
										<td colspan="2" class="bordered">Кол-во листов <xsl:value-of select="ecd:TotalSheetNumber"/>
										</td>
										<td colspan="2" class="bordered">Процедура<br/>
											<xsl:apply-templates select="ecd:CustomsModeCode"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:PreviousCustomsModeCode"/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered" colspan="5">Общие сведения</td>
										<td class="bordered" colspan="8">Сведения о товарах</td>
										<td class="bordered" colspan="2">Сведения о документах</td>
										<td class="bordered" rowspan="4">Код изменений</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered" rowspan="2">N п/п</td>
										<td class="bordered" rowspan="2">Общая накладная</td>
										<td class="bordered" rowspan="2">Инд. накладная</td>
										<td class="bordered" rowspan="2">Инд. отправитель<sup>1</sup>
										</td>
										<td class="bordered" rowspan="2">Инд. получатель<sup>2</sup>
										</td>
										<td class="bordered" rowspan="2">N п/п</td>
										<td class="bordered" rowspan="2">Наименование</td>
										<td class="bordered" rowspan="2">Код ТН ВЭД ЕАЭС</td>
										<td class="bordered" rowspan="2">Кол-во</td>
										<td class="bordered" colspan="2">Вес</td>
										<td class="bordered" rowspan="2">Валюта, стоимость</td>
										<td class="bordered" rowspan="2">Таможенная стоимость</td>
										<td class="bordered" rowspan="2">Код, признак</td>
										<td class="bordered" rowspan="2">Дата, номер</td>
										<!--td class="bordered" rowspan="3"/-->
									</tr>
									<tr align="center" valign="top">
										<td class="bordered">брутто</td>
										<td class="bordered">нетто</td>
									</tr>
									<tr align="center">
										<td class="bordered">1</td>
										<td class="bordered">2</td>
										<td class="bordered">3</td>
										<td class="bordered">4</td>
										<td class="bordered">5</td>
										<td class="bordered">6</td>
										<td class="bordered">7</td>
										<td class="bordered">8</td>
										<td class="bordered">9</td>
										<td class="bordered">10</td>
										<td class="bordered">11</td>
										<td class="bordered">12</td>
										<td class="bordered">13</td>
										<td class="bordered">14</td>
										<td class="bordered">15</td>
									</tr>
									<xsl:for-each select="ecd:GoodsShipment/ecd:HouseShipment">
										<xsl:variable name="rowspan" select="count(ecd:GoodsItemDetails[not(ecd:PresentedDocDetails)])+count(ecd:GoodsItemDetails/ecd:PresentedDocDetails)"/>
										<tr align="center" valign="top">
											<td class="bordered">
												<xsl:if test="$rowspan &gt; 0">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan+1"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates select="ecd:ObjectOrdinal"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="doc" select="ecd:TransportDocumentDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="doc" select="ecd:HouseWaybillDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="org" select="ecd:ConsignorDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="org" select="ecd:ConsigneeDetails"/>
											</td>
											<xsl:if test="not(ecd:GoodsItemDetails)">
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
											</xsl:if>
											<xsl:apply-templates select="ecd:GoodsItemDetails[1]" mode="dt"/>
										</tr>
										<xsl:for-each select="ecd:GoodsItemDetails[position() = 1]">
											<xsl:for-each select="ecd:PresentedDocDetails[position() &gt; 1]">
												<tr align="center" valign="top">
													<xsl:apply-templates select="."/>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="ecd:GoodsItemDetails[position() &gt; 1]">
											<tr align="center" valign="top">
												<xsl:apply-templates select="." mode="dt"/>
											</tr>
											<xsl:for-each select="ecd:PresentedDocDetails[position() &gt; 1]">
												<tr align="center" valign="top">
													<xsl:apply-templates select="."/>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<tr align="center" valign="top">
											<td class="bordered_fat2" colspan="8" align="left">
												Всего по индивидуальной накладной<br/>(общий вес брутто, таможенная стоимость)
											</td>
											<td class="bordered_fat2">
												<xsl:apply-templates mode="quantity" select="ecd:UnifiedGrossWeightQuantity"/>
											</td>
											<td class="bordered_fat2" colspan="2"/>
											<td class="bordered_fat2">
												<xsl:apply-templates mode="pricevalue" select="ecd:CustomsCost"/>
											</td>
											<td class="bordered_fat2" colspan="2"/>
											<td class="bordered_fat2">
												<xsl:apply-templates select="ecd:ChangeDetails"/>
											</td>
										</tr>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered_fat3" colspan="9" align="left">
												Всего по декларации на товары для экспресс-грузов<br/>(общий вес брутто, таможенная стоимость)
											</td>
										<td class="bordered_fat3">
											<xsl:apply-templates mode="quantity" select="ecd:GoodsShipment/ecd:UnifiedGrossWeightQuantity"/>
										</td>
										<td class="bordered_fat3" colspan="2"/>
										<td class="bordered_fat3">
											<xsl:apply-templates mode="pricevalue" select="ecd:GoodsShipment/ecd:CustomsCost"/>
										</td>
										<td class="bordered_fat3" colspan="2"/>
										<td class="bordered_fat3">
											<xsl:apply-templates select="ecd:ChangeDetails"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table cellpadding="4">
								<tbody>
									<xsl:variable name="cnt_GoodsItemDetails" select="count(ecd:GoodsShipment/ecd:HouseShipment/ecd:GoodsItemDetails/ecd:CustomsPaymentDetails)+count(ecd:GoodsShipment/ecd:HouseShipment)+4"/>
									<xsl:variable name="row_part1" select="number($cnt_GoodsItemDetails)-number(2)"/>
									<tr align="center" valign="top">
										<td class="bordered" colspan="8">B. Исчисление платежей</td>
										<td class="bordered" align="left" rowspan="{$row_part1}">Сведения о лице, заполнившем КДТЭГ, дата
											<br/>
											<br/>
											<xsl:apply-templates select="ecd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode"/>
											<xsl:if test="ecd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode and ecd:BrokerRegistryDocDetails/RUScat_ru:RegistrationNumberId">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:apply-templates select="ecd:BrokerRegistryDocDetails/RUScat_ru:RegistrationNumberId"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonMiddleName"/>
											<br/>
											<xsl:apply-templates mode="identitycard" select="ecd:SignatoryPerson/ecd:SignatoryPersonIdentityDetails"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonPost"/>
											<br/>
											<xsl:if test="ecd:SignatoryPerson/ecd:SigningDetails/RUScat_ru:SigningDate">
												<xsl:apply-templates mode="russian_date" select="ecd:SignatoryPerson/ecd:SigningDetails/RUScat_ru:SigningDate"/>
												<br/>
											</xsl:if>
											<!--xsl:apply-templates select="ecd:SignatoryPerson/ecd:PowerOfAttorneyDetails/catESAD_cu:DocKindCode"/-->
											<xsl:if test="ecd:SignatoryPerson/ecd:PowerOfAttorneyDetails"><br/></xsl:if>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:PowerOfAttorneyDetails"/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered">Товар</td>
										<td class="bordered">Вид</td>
										<td class="bordered">База для исчисления</td>
										<td class="bordered">Код базы для исчисления</td>
										<td class="bordered">Ставка</td>
										<td class="bordered">Сумма</td>
										<td class="bordered">Предшествующая сумма</td>
										<td class="bordered">Изменения</td>
									</tr>
									<tr align="center">
										<td class="bordered">1</td>
										<td class="bordered">2</td>
										<td class="bordered">3</td>
										<td class="bordered">4</td>
										<td class="bordered">5</td>
										<td class="bordered">6</td>
										<td class="bordered">7</td>
										<td class="bordered">8</td>
									</tr>
									<xsl:for-each select="ecd:GoodsShipment/ecd:HouseShipment">
										<xsl:variable name="party" select="."/>
										<xsl:variable name="cnt1_CustomsPaymentDetails" select="count(../ecd:CustomsPaymentDetails)"/>
										<xsl:for-each select="ecd:CustomsPaymentDetails">
											<tr align="center">
												<xsl:if test="position()=1">
													<td class="bordered" rowspan="{$cnt1_CustomsPaymentDetails}"/>
												</xsl:if>
												<td class="bordered">
													<xsl:apply-templates select="RUDECLcat:PaymentModeCode"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates select="RUDECLcat:TaxBase"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates select="RUDECLcat:TaxBaseCurrencyCode"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates mode="rate1" select="."/>
												</td>
												<td class="bordered">
													<xsl:apply-templates select="RUDECLcat:PaymentAmount"/>
												</td>
												<td class="bordered"/>
												<td class="bordered"/>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ecd:GoodsItemDetails">
											<xsl:variable name="partyDetails" select="."/>
											<xsl:variable name="cnt_CustomsPaymentDetails" select="count(ecd:CustomsPaymentDetails)"/>
											<xsl:for-each select="ecd:CustomsPaymentDetails">
												<tr align="center">
													<xsl:if test="position()=1">
														<td class="bordered" rowspan="{$cnt_CustomsPaymentDetails}">
															<xsl:value-of select="$party/ecd:ObjectOrdinal"/>
															<xsl:text>/</xsl:text>
															<xsl:value-of select="$partyDetails/ecd:GoodsNumeric"/>
														</td>
													</xsl:if>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:PaymentModeCode"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:TaxBase"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:TaxBaseCurrencyCode"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates mode="rate1" select="."/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="RUDECLcat:PaymentAmount"/>
													</td>
													<td class="bordered"/>
													<td class="bordered"/>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<tr align="center" valign="top">
											<td class="bordered_fat2">
												Всего по индивидуальной накладной
											</td>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2">
												<xsl:variable name="sum_1" select="sum(ecd:GoodsItemDetails/ecd:CustomsPaymentDetails/RUDECLcat:PaymentAmount)"/>
												<xsl:variable name="sum_2" select="sum(ecd:CustomsPaymentDetails/RUDECLcat:PaymentAmount)"/>
												<xsl:variable name="sum_total" select="$sum_1 + $sum_2"/>
												<xsl:value-of select="round($sum_total * 100) div 100"/>
											</td>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2"/>
											<xsl:if test="position()=last()">
												<td class="bordered" align="left" rowspan="2">
													<xsl:text>C</xsl:text>
													<br/>
													<xsl:if test="$ExpressCargoDeclarationCustomMark">
														
													</xsl:if>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered_fat3">
											Всего по декларации на товары для экспресс-грузов
										</td>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3">
											<xsl:value-of select="ecd:GoodsShipment/ecd:TotalPaymentAmountDetails/RUScat_ru:Amount"/>
										</td>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3"/>
									</tr>
									<tr>
										<td class="bordered" colspan="8">
											<div width="100%" align="center">B1. Подробности уплаты (взыскания)</div>
											<br/>
											<xsl:for-each select="ecd:GoodsShipment/ecd:FactCustomsPayment">
												<xsl:if test="position()!=1">
													<br/>
												</xsl:if>
												<xsl:apply-templates select="catESAD_cu:PaymentModeCode"/>
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="catESAD_cu:PaymentAmount"/>
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="catESAD_cu:PaymentCurrencyCode"/>
												<xsl:text> - </xsl:text>
												<xsl:choose>
													<xsl:when test="ecd:PaymentDocument/cat_ru:PrDocumentNumber">
														<xsl:apply-templates select="ecd:PaymentDocument/cat_ru:PrDocumentNumber"/>
													</xsl:when>
													<xsl:otherwise>--</xsl:otherwise>
												</xsl:choose>
												<xsl:text> - </xsl:text>
												<xsl:choose>
													<xsl:when test="ecd:PaymentDocument/cat_ru:PrDocumentDate">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="ecd:PaymentDocument/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>--</xsl:otherwise>
												</xsl:choose>
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="ecd:PaymentWayCode"/>
												<xsl:if test="ecd:RFOrganizationFeatures/cat_ru:INN">
													<xsl:text> - </xsl:text>
													<xsl:apply-templates select="ecd:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td class="bordered" align="left" rowspan="3" valign="top">D</td>
									</tr>
								</tbody>
							</table>
						</xsl:if>
						<xsl:if test="ecd:ExpressRegistryKindCode = 'КПТДЭГ'">
							<table cellpadding="4">
								<tbody>
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
									</tr>
									<tr>
										<td colspan="17" style="border-top:1px solid black;border-left:1px solid black; border-right:1px solid black;" align="center" valign="middle">
											<b>Корректировка пассажирской таможенной декларации для экспресс-грузов</b>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" colspan="5" rowspan="3">Отправитель (по общей накладной)<br/>
											<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsignorDetails"/>
										</td>
										<td class="bordered" colspan="4" rowspan="3">Получатель (по общей накладной)<br/>
											<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsigneeDetails"/>
										</td>
										<td class="bordered" colspan="2" rowspan="2">
											<xsl:text>A</xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="ecd:ExpressCargoDeclarationIdDetails">
													<xsl:apply-templates mode="reg_num" select="ecd:ExpressCargoDeclarationIdDetails"/>
													<xsl:text>/</xsl:text>
													<xsl:variable name="numPP" select="concat('00', ecd:NumPP)"/>
													<xsl:value-of select="substring($numPP, string-length($numPP) - 1)"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="$ExpressCargoDeclarationCustomMark">
														<xsl:apply-templates mode="reg_num" select="$ExpressCargoDeclarationCustomMark/ecdcm:ApplicationRegNumber"/>
														<xsl:text>/</xsl:text>
														<xsl:variable name="numPP" select="concat('00', ecd:NumPP)"/>
														<xsl:value-of select="substring($numPP, string-length($numPP) - 1)"/>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="bordered" colspan="3" rowspan="3">
											<xsl:text>Место нахождения товаров</xsl:text>
											<br/>
											<xsl:if test="ecd:GoodsShipment/ecd:GoodsLocationDetails/ecd:SubjectAddressDetails">
												<xsl:apply-templates select="ecd:GoodsShipment/ecd:GoodsLocationDetails/ecd:SubjectAddressDetails"/>
											</xsl:if>
										</td>
										<td class="bordered" colspan="2">КПТДЭГ</td>
										<td class="bordered" rowspan="2">Особенность<br/>
											<xsl:apply-templates select="ecd:DeclarationKind"/>
										</td>
									</tr>
									<tr>
										<td style="border-right: 1px solid black;">
											<xsl:apply-templates select="ecd:DeclarationKindCode"/>
										</td>
										<td>
											<xsl:apply-templates select="ecd:ElectronicDocumentSign"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" colspan="2">Предшествующий&#160;документ<br/>
											<xsl:apply-templates select="//ecd:PrecedingDocDetails[generate-id() = generate-id(key('uniquePDD', .)[1])]"/>
										</td>
										<td class="bordered" colspan="3">Кол-во листов <xsl:value-of select="ecd:TotalSheetNumber"/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered" colspan="5">Общие сведения</td>
										<td class="bordered" colspan="7">Сведения о товарах</td>
										<td class="bordered" colspan="2">Сведения о документах</td>
										<td class="bordered" colspan="3" rowspan="3">Код изменений</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered">N п/п</td>
										<td class="bordered">Общая накладная</td>
										<td class="bordered">Инд. накладная</td>
										<td class="bordered">Инд. отправитель<sup>1</sup>
										</td>
										<td class="bordered">Инд. получатель<sup>2</sup>
										</td>
										<td class="bordered">N п/п</td>
										<td class="bordered">Наименование</td>
										<td class="bordered">Код ТН ВЭД ЕАЭС</td>
										<td class="bordered">Кол-во</td>
										<td class="bordered">Вес брутто</td>
										<td class="bordered">Валюта, стоимость</td>
										<td class="bordered">Валюта, стоимость в валюте государства-члена</td>
										<td class="bordered">Код, признак</td>
										<td class="bordered">Дата, номер</td>
									</tr>
									<tr align="center">
										<td class="bordered">1</td>
										<td class="bordered">2</td>
										<td class="bordered">3</td>
										<td class="bordered">4</td>
										<td class="bordered">5</td>
										<td class="bordered">6</td>
										<td class="bordered">7</td>
										<td class="bordered">8</td>
										<td class="bordered">9</td>
										<td class="bordered">10</td>
										<td class="bordered">11</td>
										<td class="bordered">12</td>
										<td class="bordered">13</td>
										<td class="bordered">14</td>
									</tr>
									<xsl:for-each select="ecd:GoodsShipment/ecd:HouseShipment">
										<xsl:variable name="rowspan_p" select="count(ecd:GoodsItemDetails[not(ecd:PresentedDocDetails)])+count(ecd:GoodsItemDetails/ecd:PresentedDocDetails)"/>
										<tr align="center" valign="top">
											<td class="bordered">
												<xsl:if test="$rowspan_p &gt; 0">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p+1"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates select="ecd:ObjectOrdinal"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan_p &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="doc" select="ecd:TransportDocumentDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan_p &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="doc" select="ecd:HouseWaybillDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan_p &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="org" select="ecd:ConsignorDetails"/>
											</td>
											<td class="bordered">
												<xsl:if test="$rowspan_p &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
												</xsl:if>
												<xsl:apply-templates mode="org" select="ecd:ConsigneeDetails"/>
											</td>
											<xsl:if test="not(ecd:GoodsItemDetails)">
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered"/>
											</xsl:if>
											<xsl:apply-templates select="ecd:GoodsItemDetails[1]" mode="ptd"/>
										</tr>
										<xsl:for-each select="ecd:GoodsItemDetails[position() = 1]">
											<xsl:for-each select="ecd:PresentedDocDetails[position() &gt; 1]">
												<tr align="center" valign="top">
													<xsl:apply-templates select="."/>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="ecd:GoodsItemDetails[position() &gt; 1]">
											<tr align="center" valign="top">
												<xsl:apply-templates select="." mode="ptd"/>
											</tr>
											<xsl:for-each select="ecd:PresentedDocDetails[position() &gt; 1]">
												<tr align="center" valign="top">
													<xsl:apply-templates select="."/>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<tr align="center" valign="top">
											<td class="bordered_fat2" colspan="8" align="left">
												Всего по индивидуальной накладной<br/>(общий вес брутто, стоимость в валюте государства-члена)
											</td>
											<td class="bordered_fat2">
												<xsl:apply-templates mode="quantity" select="ecd:UnifiedGrossWeightQuantity"/>
											</td>
											<td class="bordered_fat2"/>
											<td class="bordered_fat2">
												<xsl:apply-templates mode="pricevalue" select="ecd:CAValueAmount"/>
											</td>
											<td class="bordered_fat2" colspan="2"/>
											<td class="bordered_fat2" colspan="3">
												<xsl:apply-templates select="ecd:ChangeDetails"/>
											</td>
										</tr>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered_fat3" colspan="9" align="left">
												Всего по пассажирской таможенной декларации для экспресс-грузов<br/>(общий вес брутто, стоимость в валюте государства-члена)
											</td>
										<td class="bordered_fat3">
											<xsl:apply-templates mode="quantity" select="ecd:GoodsShipment/ecd:UnifiedGrossWeightQuantity"/>
										</td>
										<td class="bordered_fat3"/>
										<td class="bordered_fat3">
											<xsl:apply-templates mode="pricevalue" select="ecd:GoodsShipment/ecd:CAValueAmount"/>
										</td>
										<td class="bordered_fat3" colspan="2"/>
										<td class="bordered_fat3" colspan="3">
											<xsl:apply-templates select="ecd:ChangeDetails"/>
										</td>
									</tr>
									<tr>
										<td colspan="17">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="17">Сведения о лице, заполнившем КПТДЭГ, дата
											<br/>
											<br/>
											<xsl:apply-templates select="ecd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode"/>
											<xsl:if test="ecd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode and ecd:BrokerRegistryDocDetails/RUScat_ru:RegistrationNumberId">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:apply-templates select="ecd:BrokerRegistryDocDetails/RUScat_ru:RegistrationNumberId"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonMiddleName"/>
											<br/>
											<xsl:apply-templates mode="identitycard" select="ecd:SignatoryPerson/ecd:SignatoryPersonIdentityDetails"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonPost"/>
											<br/>
											<xsl:apply-templates select="ecd:SignatoryPerson/ecd:PowerOfAttorneyDetails/catESAD_cu:DocKindCode"/>
											<br/>
											<xsl:apply-templates mode="russian_date" select="ecd:SignatoryPerson/ecd:SigningDetails/RUScat_ru:SigningDate"/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="17" valign="top">C<br/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="17" valign="top">D<br/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:if>
					</xsl:if>
					<br/>
					<table cellpadding="4" width="100%">
						<tr>
							<td width="1%">
								<sup>1</sup>
							</td>
							<td width="99%">Декларант при вывозе товаров с таможенной территории Евразийского экономического союза.</td>
						</tr>
						<tr>
							<td>
								<sup>2</sup>
							</td>
							<td>Декларант при ввозе товаров на таможенную территорию Евразийского экономического союза.</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="graphC">
		<xsl:param name="base"/>
		<xsl:for-each select="ecdcm:Consignment[ecdcm:DecisionCode != '31']">
			
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="graphD">
		<xsl:param name="base"/>
		<xsl:for-each select="ecdcm:Consignment[ecdcm:DecisionCode = '31']">
			
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="ecd:GoodsLocationDetails">
		<xsl:if test="ecd:GoodsLocationPlaceCode">
			<xsl:text>Код: </xsl:text><xsl:value-of select="ecd:GoodsLocationPlaceCode"/>
		</xsl:if>
		<xsl:if test="ecd:CustomsOfficeCode">
			<xsl:text> Код ТО: </xsl:text>
			<xsl:value-of select="ecd:CustomsOfficeCode"/>
		</xsl:if>
		<xsl:if test="ecd:RegisterDocumentIdDetails">
			<br/>
			<xsl:text> Свидетельство № </xsl:text>
			<xsl:value-of select="ecd:RegisterDocumentIdDetails/catESAD_cu:DocId"/>
		</xsl:if>
		<xsl:if test="ecd:PlaceName">
			<br/>
			<xsl:value-of select="ecd:PlaceName"/>
		</xsl:if>
		<xsl:if test="ecd:SubjectAddressDetails">
			<br/>
			<xsl:apply-templates select="ecd:SubjectAddressDetails"/>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="ecd:GoodsShipment/ecd:GoodsLocationDetails/ecd:SubjectAddressDetails">
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="ecd:PowerOfAttorneyDetails">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:DocStartDate">
			<xsl:text>, начало </xsl:text>
			<xsl:apply-templates mode="russian_date" select="catESAD_cu:DocStartDate"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:DocValidityDate">
			<xsl:text>, окончание </xsl:text>
			<xsl:apply-templates mode="russian_date" select="catESAD_cu:DocValidityDate"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:CountryCode">
			<xsl:text>, код страны </xsl:text>
			<xsl:apply-templates select="catESAD_cu:CountryCode"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:DocKindCode">
			<xsl:text>, код вида </xsl:text>
			<xsl:apply-templates select="catESAD_cu:DocKindCode"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template mode="identitycard" match="*">
		<xsl:apply-templates select="RUScat_ru:CountryCode"/>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:if test="RUScat_ru:CountryCode">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:IdentityCardName">, </xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardSeries">серия <xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>&#160;</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardNumber">№ <xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">, </xsl:if>
			<xsl:apply-templates mode="russian_date" select="RUScat_ru:IdentityCardDate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="rate1">

		<xsl:choose>
			<xsl:when test="RUDECLcat:Rate or RUDECLcat:Rate!=''">
				<xsl:apply-templates select="RUDECLcat:Rate" mode="rate_val"/>
			</xsl:when>
			<xsl:otherwise> 0 </xsl:otherwise>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="RUDECLcat:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="RUDECLcat:RateTypeCode!='*' or not(RUDECLcat:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="RUDECLcat:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUDECLcat:RateCurrencyCode"/>
						<xsl:if test="RUDECLcat:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:apply-templates select="RUDECLcat:WeightingFactor"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUDECLcat:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise> % </xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="rate_val">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.######')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="cat_ru:CustomsCode|ecd:CountryCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="russian_date_gtd" select="cat_ru:RegistrationDate|ecd:PIDate"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber|ecd:PINumber"/>
	</xsl:template>
	<xsl:template match="ecd:GoodsItemDetails" mode="dt">
		<xsl:variable name="rowspandoc" select="count(ecd:PresentedDocDetails)"/>
		<xsl:variable name="isCorrection" select="../../../ecd:DocType"/>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="ecd:GoodsNumeric"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="ecd:GoodsDescription"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="ecd:GoodsTNVEDCode"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="quantity" select="ecd:SupplementaryQuantity"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="quantity" select="ecd:GrossWeightQuantity"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="quantity" select="ecd:NetWeightQuantity"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="pricevalue" select="ecd:CAValueAmount[1]"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="pricevalue" select="ecd:CustomsCost"/>
		</td>
		<xsl:if test="not(ecd:PresentedDocDetails)">
			<td class="bordered"/>
			<td class="bordered"/>
		</xsl:if>
		<xsl:apply-templates select="ecd:PresentedDocDetails[1]"/>
		<td class="bordered" align="left">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="$isCorrection = '0'">
				<xsl:apply-templates select="ecd:Note"/>
				<xsl:if test="ecd:URLGood and ecd:Note">
					<br/>
				</xsl:if>
				<xsl:variable name="url" select="ecd:URLGood"/>
				<a style="font-size:8pt;" href="{$url}" target="_blank">
					<xsl:value-of select="$url"/>
				</a>
			</xsl:if>
			<xsl:if test="$isCorrection = '1'">
				<xsl:apply-templates select="ecd:ChangeDetails"/>
			</xsl:if>
		</td>
	</xsl:template>
	<xsl:template match="ecd:GoodsItemDetails" mode="ptd">
		<xsl:variable name="rowspandoc" select="count(ecd:PresentedDocDetails)"/>
		<xsl:variable name="isCorrection" select="../../../ecd:DocType"/>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="ecd:GoodsNumeric"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="ecd:GoodsDescription"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="ecd:GoodsTNVEDCode"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="quantity" select="ecd:SupplementaryQuantity"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="quantity" select="ecd:GrossWeightQuantity"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="pricevalue" select="ecd:CAValueAmount[1]"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="pricevalue" select="ecd:CAValueAmount[2]"/>
		</td>
		<xsl:if test="not(ecd:PresentedDocDetails)">
			<td class="bordered"/>
			<td class="bordered"/>
		</xsl:if>
		<xsl:apply-templates select="ecd:PresentedDocDetails[1]"/>
		<td class="bordered" colspan="3" align="left">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="$isCorrection = '0'">
				<xsl:apply-templates select="ecd:Note"/>
				<xsl:if test="ecd:URLGood and ecd:Note">
					<br/>
				</xsl:if>
				<xsl:variable name="url" select="ecd:URLGood"/>
				<a style="font-size:8pt;" href="{$url}" target="_blank">
					<xsl:value-of select="$url"/>
				</a>
			</xsl:if>
			<xsl:if test="$isCorrection = '1'">
				<xsl:apply-templates select="ecd:ChangeDetails"/>
			</xsl:if>
		</td>
	</xsl:template>
	<xsl:template match="ecd:ChangeDetails">
		<xsl:apply-templates select="ecd:StageChangeCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="ecd:ReasonChangeCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="ecd:QuantityChangeCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="ecd:TNVEDChangeCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="ecd:CustomsCostChangeCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="ecd:CustomsPaymentChangeCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="ecd:OtherChangeCode"/>
	</xsl:template>
	<xsl:template match="ecd:PresentedDocDetails">
		<td class="bordered">
			<xsl:apply-templates select="RUDECLcat:DocKindCode"/>
			<xsl:if test="ecd:DocumentPresentingDetails/RUDECLcat:DocPresentKindCode">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="ecd:DocumentPresentingDetails/RUDECLcat:DocPresentKindCode"/>
			</xsl:if>
		</td>
		<td class="bordered">
			<xsl:if test="cat_ru:PrDocumentNumber">
				<xsl:text>№ </xsl:text>
				<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				<br/>
			</xsl:if>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
		</td>
	</xsl:template>
	<xsl:template match="*" mode="pricevalue">
		<xsl:apply-templates select="ecd:CurrencyQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:if test="ecd:CurrencyCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="ecd:CurrencyCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
		
		<xsl:if test="contains(local-name(.), 'Consignor')">
			<br/>
			<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
			<xsl:if test="not(RUScat_ru:CountryA2Code)">
				<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode"/>
			</xsl:if>
		</xsl:if>
		
	</xsl:template>
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:apply-templates select="."/>
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
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<!--xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if-->
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<!--xsl:value-of select="cat_ru:PrDocumentName"/-->
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
		</xsl:if>
		<xsl:if test="ecd:DocKindCode">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="ecd:DocKindCode"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ecd:PrecedingDocDetails">
		<xsl:if test="position()!=1"><br/></xsl:if>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text> - </xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates mode="russian_date" select="."/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ecd:CustomsDocIdDetails|ecd:PIDocumentNumber">
		<xsl:apply-templates mode="reg_num" select="."/>
	</xsl:template>
	<xsl:template match="ecd:TIRIdDetails">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ecd:PrecedingGoodsDetails">
		<xsl:if test="ecd:DeclGrossWeightQuantity">
			<xsl:apply-templates select="ecd:DeclGrossWeightQuantity/cat_ru:GoodsQuantity"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="ecd:DeclGrossWeightQuantity/cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="ecd:DeclGrossWeightQuantity and ecd:SupplementaryQuantity">
			<xsl:text> (</xsl:text>
		</xsl:if>
		<xsl:if test="ecd:SupplementaryQuantity">
			<xsl:for-each select="ecd:SupplementaryQuantity">
				<xsl:if test="position()!=1">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="ecd:DeclGrossWeightQuantity and ecd:SupplementaryQuantity">
			<xsl:text>)</xsl:text>
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
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ExpressCargoDeclaration']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="//*[local-name()='ExpressCargoDeclarationCustomMark']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
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
